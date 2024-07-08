*** Settings ***
Documentation    Representacao do menu superior

Library    Browser

*** Keywords ***
Verify Toaster
    [Arguments]    ${expected_message}
    Wait For Elements State
    ...    css=.Toastify__toast-body div >> text=${expected_message}
    ...    visible    5   

    #Wait For Elements State             // Aguarda o elemento desaparecer da tela
    #...    css=.Toastify__toast-body div
    #...    detached    10  