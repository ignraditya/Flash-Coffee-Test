*** Keywords ***
Spawn Appium Server
  Run Keyword Unless        ${REMOTE_APPIUM_SERVER}     Spawn Local Appium Server
  Open Device Application
  Allow Device Location

  Register Keyword To Run On Failure    Capture Page Screenshot
  DeviceUtility.Get Device Dimensions
  DeviceUtility.Get Top Height General On Home

Spawn Local Appium Server
  Run Process   kill $(lsof -t -i:${PORT})    shell=true
  Run Keyword and Ignore Error                Run Process   rm -f ${WORKING_PATH}/appium-log.txt    shell=true
  Start Process   appium
  ...   -p    ${PORT}
  ...   -bp   ${BOOTSTRAP_PORT}
  ...   alias=appiumVideo
  ...   stdout=${WORKING_PATH}/appium-log.txt

  Wait Until Appium Ready   ${PORT}           40
  Run Process    adb -s ${UDID} shell pm clear ${APP_PACKAGE}   shell=True

Open Device Application
  Open Application    ${APPIUM_SERVER}
  ...   platformName=${PLATFORM_NAME}
  ...   deviceName=${DEVICE_NAME}
  ...   appPackage=${APP_PACKAGE}
  ...   appActivity=${APP_ACTIVITY}
  ...   udid=${UDID}
  ...   newCommandTimeout=3000
  ...   fullReset=false
  ...   alias=appiumVideo
  ...   noReset=True
  ...   automationName=UiAutomator1

Close Appium Server
  ${device}=        Run Process    adb devices -l   shell=True
  Log To Console    ${device.stdout}
  Run Process       adb -s ${UDID} shell pm clear ${APP_PACKAGE}   shell=True
  Close Application

Allow Device Location
  ${status}=            Run Keyword And Return Status               Wait Until Element Is Visible         id=com.android.packageinstaller:id/permission_allow_button          timeout=5
  Run Keyword If        '${status}'=='${True}'                         Click Element                         id=com.android.packageinstaller:id/permission_allow_button
