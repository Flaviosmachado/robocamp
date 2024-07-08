*** Settings ***
Documentation    Tudo comeca aqui

Resource    components/nav.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource
Resource    database.resource
Resource    services/sessions.resource

Library    JSONLibrary

*** Keywords ***
#helpers
Do Login
    [Arguments]    ${user}
    Go To Login Page
    Fill Credentials       ${user}[email]    ${user}[pass]       
    Submit Credentials
    User Should Be Logged In    ${user}[name]

Get fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load Json From File    ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...           encoding=UTF-8

    RETURN    ${fixture}