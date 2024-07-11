*** Settings ***
Documentation    Consumindo a rota students da API REST

Resource     ../base.resource

*** Keywords ***
POST New Student
    [Arguments]    ${token}    ${student}

    ${headers}    Create Dictionary    Authorization=${token}

    ${admin}    Get Fixture    Admin    

    ${response}    POST    http://localhost:3333/students
    ...                    headers=${headers}
    ...                    expected_status=201
    ...                    json=${student}

    RETURN     ${response.json()}[id]
