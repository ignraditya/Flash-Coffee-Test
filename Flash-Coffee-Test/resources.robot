*** Settings ***
Library         AppiumLibrary    15    run_on_failure=Log Source
Library         Collections
Library         String
Library         Process
Library         DebugLibrary
Library         XML

Resource        keyword/LogicImport.robot
Resource        keyword/UtilityImport.robot
Resource        ExternalLibrary/ExternalLibrary.robot

*** Variables ***
${APPIUM_SERVER}            http://localhost:${PORT}/wd/hub
${APP_PACKAGE}              com.flashcoffee
${APP_ACTIVITY}             com.flashcoffee.SplashActivity
# ${APP_ACTIVITY}             com.flashcoffee.MainActivity
${UDID}                     emulator-5554
${PORT}                     4729
${BOOTSTRAP_PORT}           50009
${PLATFORM_NAME}            Android
${DEVICE_NAME}              FlashCoffee
${REMOTE_APPIUM_SERVER}     ${FALSE}
${WORKING_PATH}             ${EXECDIR}
