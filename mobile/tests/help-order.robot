*** Settings ***
Documentation    Suite de teste de ajuda

Resource    ../resources/base.resource

Test Setup       Start App
Test Teardown    Finish App


*** Test Cases ***
You should be able to ask for help

    ${admin}     Get Fixture    admin
    ${flavio}    Get Fixture    flavio

    Reset student        ${flavio}[student][email]

    ${token}           Get Service Token    ${admin}
    ${student_id}      POST New Student     ${token}         ${flavio}[student]
    POST New Enroll    ${token}             ${student_id}
    
    Login With Student Id    ${student_id}
    Confirm PopUp
    Go to Help Order
    Submit Help Order        ${flavio}[help]
    
    Wait Until Page Contains           Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.