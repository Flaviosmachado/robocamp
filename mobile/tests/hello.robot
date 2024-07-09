*** Settings ***
Documentation    Robot mais appium

Library    AppiumLibrary


*** Test Cases ***
Deve abrir o app da smartbit
    Open Application    http://localhost:4723/wd/hub
    ...    alias=Smartbit
    ...    devideName=Android Simulator
    ...    platformName=Android 
    ...    automationName=UiAutomator2
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    udid=emulator-5554

    Sleep    10
    Close All Applications