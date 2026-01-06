"""
To start/stop windows based services
"""
import ctypes
import time
import win32service as ws

class WinServiceUtil:
    '''
    Utility file for starting/stopping the windows services.
    '''

    @staticmethod
    def checkIsUserAdmin():
        '''
        Method to check whether the script is executing administrator user or not
        '''
        return ctypes.windll.shell32.IsUserAnAdmin()

    @staticmethod
    def getWindowsServiceHandler(serviceName, machine=''):
        '''
        Method to get the windows service handlers
        '''
        if not WinServiceUtil.checkIsUserAdmin():
            raise Exception("Please launch the script with administrator user!!")
        serviceMangrHandler = ws.OpenSCManager(machine, None, ws.SC_MANAGER_ALL_ACCESS)
        try:
            serviceHandler = ws.OpenService(serviceMangrHandler, serviceName, ws.SERVICE_ALL_ACCESS)
            return serviceMangrHandler, serviceHandler
        except Exception as ex:
            ws.CloseServiceHandle(serviceMangrHandler)
            raise Exception("Unable to get service handler") from ex

    @staticmethod
    def getServiceRunningStatus(serviceHandler):
        '''
        Method to get the status of service
        '''
        statusCodeMap = {1: 'Stopped', 2: 'Starting', 4: 'Running'}
        statusCode = ws.QueryServiceStatusEx(serviceHandler)['CurrentState']
        if statusCode in statusCodeMap:
            return statusCodeMap[statusCode]
        return statusCode

    @staticmethod
    def startService(serviceHandler, args=None):
        '''
        Method to start the windows service
        serviceHandler: service handler
        machine: machine name if not provide local machine name will be used
        '''
        try:
            if WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Stopped':
                ws.StartService(serviceHandler, args)
                if WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Running':
                    return True
                if WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Starting':
                    for waitSecs in range(1, 10):
                        time.sleep(waitSecs) # Waiting for service to go in to run state
                        if WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Running':
                            return True
                return False
            if WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Running':
                print("An instance/service is already running")
                return True
            return False
        except Exception as ex:
            raise Exception(f"Unable to start the service: {ex}") from ex

    @staticmethod
    def stopService(serviceHandler):
        '''
        Method to stop the running service
        '''
        try:
            status = False
            if WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Running':
                ws.ControlService(serviceHandler, ws.SERVICE_CONTROL_STOP)
                for waitSecs in range(1, 10):
                    time.sleep(waitSecs) # Waiting for service to go in to stop state
                    if WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Stopped':
                        status = True
                        break
            elif WinServiceUtil.getServiceRunningStatus(serviceHandler) == 'Stopped':
                status = True
            return status
        except Exception as ex:
            raise Exception(f"Unable to stop the service: {ex}") from ex

    @staticmethod
    def cleanupServiceHandlers(serviceMangrHandler, serviceHandler):
        '''
        Method to close the service handler connection objects.
        '''
        try:
            if serviceHandler:
                ws.CloseServiceHandle(serviceHandler)
                ws.CloseServiceHandle(serviceMangrHandler)
        except Exception as ex:
            raise Exception(f"Unable to close the service handlers: {ex}") from ex
