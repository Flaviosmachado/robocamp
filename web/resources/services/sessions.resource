*** Settings ***
Documentation    Consumindo a rota services da API REST

Resource       ../base.resource


*** Keywords ***
Get Service Token
    [Arguments]    ${user}

    ${response}    POST    http://localhost:3333/sessions
    ...                    expected_status=200
    ...                    json=${user}

    ${token}    Set Variable    Bearer ${response.json()}[token]
    
    RETURN    ${token}
