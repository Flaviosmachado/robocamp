*** Settings ***
Documentation    Suite de testes de login

Library    AppiumLibrary
Resource    ../resources/base.resource

Test Setup       Start App
Test Teardown    Finish App

*** Variables ***
${error401}    Acesso não autorizado! Entre em contato com a equipe de atendimento.

*** Test Cases ***
Should login with success

    ${falcao}    Get Fixture    falcao

    Login With Student Id    ${falcao}[student][id]
    Wait Until Page Contains    Olá, ${falcao}[student][name]!

Invalid id student
    
    Login With Student Id       9999
    Wait Until Page Contains    ${error401}

Negative id student

    Login With Student Id       -1
    Wait Until Page Contains    ${error401}

Id Alphanumeric
    
    Login With Student Id       abc123
    Wait Until Page Contains    ${error401}
    