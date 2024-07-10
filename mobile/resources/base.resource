*** Settings ***
Documentation    Arquivo principal

Library    AppiumLibrary
Library    JSONLibrary

Resource    screens/login.resource

*** Keywords ***
Start App

    Open Application    http://localhost:4723/wd/hub
    ...    alias=Smartbit
    ...    devideName=Android Simulator
    ...    platformName=Android 
    ...    automationName=UiAutomator2
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    udid=emulator-5556
    
    Wait Until Page Contains     Informe seu código de acesso

Finish App
    Capture Page Screenshot
    Close All Applications

#Helpers
Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load Json From File
    ...           ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...           encoding=UTF-8
    RETURN        ${fixture}