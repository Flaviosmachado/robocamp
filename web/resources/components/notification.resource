*** Settings ***
Documentation    Representacao do componente de notificacao

Library    Browser

*** Keywords ***
Open Notifications
    Click    xpath=(//aside//button)[1]

Notifications Should be
    [Arguments]    ${text}

    ${element}    Set Variable    css=.scrollbar-container p
    
    Wait For Elements State    ${element}
    ...    visible
    ...    timeout=2

    Get Text    ${element}    equal    ${text}
