*** Settings ***
Documentation    Suite de testes de recebimento de pedido de ajuda

Resource    ../resources/base.resource

Test Teardown    Take Screenshot

*** Test Cases ***
Deve receber uma notificacao de pedido de ajuda
    
    ${admin}    Get fixture    admin
    ${joao}     Get Fixture    joao

    Reset student    ${joao}[student][email]

    ${token}         Get Service Token    ${admin}
    ${student_id}    POST New Student     ${token}    ${joao}[student]

    POST Question    ${student_id}    ${joao}[question]
    
    Do Login    ${admin}
    Open Notifications
    Notifications Should be    ${joao}[question]    