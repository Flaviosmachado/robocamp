*** Settings ***
Documentation    Consumindo a rota services da API REST

Resource   ../base.resource    # robotcode: ignore
Library    RequestsLibrary



*** Keywords ***
Get Service Token

    ${admin}    Get Fixture    Admin    

    ${response}    POST    http://localhost:3333/sessions
    ...                    expected_status=200
    ...                    json=${admin}

    ${token}    Log To Console    Bearer ${response.json()}[token]

    RETURN    ${token}