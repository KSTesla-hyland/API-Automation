Allure Report Instructions:

To have the Allure report functionality available in the framework.
First install the allure-behave , allure-pytest and allure-python-commons packages in the framework.
pip install allure-behave
pip install allure-pytest
pip install allure-python-commons
These should be installed in the same path as the interpreter.

The above package will help us to generate the report in form of json file.
In order to see them in HTML file , we have to add another plugin or application i.e., allure report.
The best way is to go to the link https://github.com/allure-framework/allure2/releases/tag/2.34.1
Download the latest zip folder and unzip it.
Copy the bin folder path(Example: C:\Users\kshivam\Downloads\allure-2.34.1\b) and add it to system variable or user variable path or both.
Restart the PyCharm.

now run the command : pytest -v -s -m "1" --disable-warnings --alluredir Reports
once it is executed run : allure serve Reports

Note: Reports is the folder where the allure will add the json file reports, if is created then it is will the folder creation or else it will create it. In the second command it requires the folder where the reports are stored.

Now we may get the below error: ImportError: cannot import name 'escape_non_unicode_symbols' from 'allure_commons.utils'

It simply means that there are some allure packages which are not up to date, we just simply have to update our allure packages.
run the below command.
pip install --upgrade allure-pytest allure-python-commons allure-behave

Now to check the version ,execute : allure --version
