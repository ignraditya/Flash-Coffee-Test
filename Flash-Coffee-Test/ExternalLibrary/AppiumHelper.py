import os
import requests

from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from time import sleep

class AppiumHelper(object):
    def __init__(self):
        self.cwd = os.getcwd()
        self.session = requests.session()

    def wait_until_appium_ready(self, port, timeout=10):
        started = False
        for i in range(int(timeout)):
            try:
                r = self.session.head("http://0.0.0.0:{}/wd/hub/status".format(port))
                if r.status_code==200:
                    started = True
                    break
            except requests.ConnectionError:
                file=open("appium-log.txt",'r')
                content = file.read()
                if "Appium REST http interface listener started" in content:
                    started = True
                    break
                if "sessionOverride: true" in content:
                    started = True
                    break
                file.close()
                sleep(1)

        if started is False:
            BuiltIn().fail("Appium did not start after %s seconds" %timeout)
