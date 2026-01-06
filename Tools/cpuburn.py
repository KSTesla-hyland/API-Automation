'''
This script can be used to benchmark a cpu using workers that will load the cpu's at 100%.
'''
import argparse
import os
import platform
import math
import multiprocessing
import time
import statistics
from logging import basicConfig, info, INFO

def forever(dummy):
    '''
    This function runs something for ever.
    '''
    print('\n\n--> Loading CPU with forever(dummy): PID: %s' % os.getpid())
    while True:
        dummy * dummy # pylint: disable=pointless-statement

def iterationMaxed(_):
    '''
    worker function, change maxIterations to accomodate the length of the worker operation.
    '''
    maxIterations = 10000000 # 16 seconds on my laptop
    # max = 1000000 # 1.6 seconds on my laptop
    info('--> Start Worker PID: %s. Iterations: %s' % (os.getpid(), maxIterations))
    start = time.time()
    x1 = 0
    while x1 < maxIterations:
        p1 = x1 * math.pi
        p1 = math.sqrt(x1 ** 2 + p1 ** 2)
        x1 += 1
    end = time.time()
    info('--> End Worker PID: {}'.format(os.getpid()) + '. Time elapsed(seconds): {t:4.3f}'.format(t=end - start))
    return

def printCpuInfo():
    '''
    Print Cpu info using cpuinfo if possible, at least platform.processor()
    '''
    print('\nPlatform processor:', platform.processor())
    try:
        from cpuinfo import cpuinfo
        cpuinfo.main()
    except Exception as err: # pylint: disable=broad-except
        print('\nERROR: running cpuinfo. Try "pip install py-cpuinfo". Error message:', err)
    print('')

def parseArgs():
    '''
    Parse args
    '''
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--forever", action="store_true",
                        help="Run for ever. Stop it in task manager.")
    parser.add_argument("-l", "--loop", type=int, default=1,
                        help="Number of times the test is run.")
    parser.add_argument("-w", "--workers", type=int, default=1,
                        help="Number of concurrent workers to run. Also correspond to number of CPU consumed.")
    parser.add_argument("-v", "--verbose", help="increase output verbosity", action="store_true")
    return parser.parse_args()

def main():
    '''
    This is the main code
    '''
    # Get args
    args = parseArgs()

    # logging configuration if verbose is enabled
    if args.verbose:
        basicConfig(format='%(message)s', level=INFO)

    # Configure number of workers to run in //
    no_of_cpu_to_be_consumed = args.workers
    print('\nNumber of CPU to be consumed:', no_of_cpu_to_be_consumed)

    # Number of time the bench will be run
    print('Number of loops:', args.loop)

    # by default use a worker that terminates
    worker = iterationMaxed
    if args.forever:
        worker = forever

    # cpu information
    printCpuInfo()

    # to keep stats
    stats = []

    # Start loading cpus
    print('Loading CPU(s)...')
    multiprocessing.freeze_support() # pylint: disable=no-member
    with multiprocessing.Pool(processes=no_of_cpu_to_be_consumed) as pool: # pylint: disable=not-callable
        loop = 0
        while loop < args.loop:
            start = time.time()
            pool.map(worker, range(no_of_cpu_to_be_consumed))
            end = time.time()
            print('Loop %s:' % loop, 'Total running time(seconds) for workers: {t:4.3f}'.format(t=end - start))
            stats.append(end - start)
            loop += 1

    # print statistics if more than one loop
    if args.loop > 1:
        print('Average time per loop: {t:4.3f}'.format(t=statistics.mean(stats)))
        print('Variance against average(smaller is better): {t:4.3f}'.format(t=statistics.variance(stats)))


if __name__ == '__main__':
    main()
