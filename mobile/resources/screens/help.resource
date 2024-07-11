*** Settings ***
Documentation    Arquivo que representa a tela de pedido de ajuda


Library    AppiumLibrary

*** Variables ***
${help_button}          //android.widget.TextView[@text="Enviar dúvida"]
${Write_your_doubt}    //android.widget.EditText[@text="Escreva sua dúvida aqui"]

*** Keywords ***
Submit Help Order
    [Arguments]    ${text}

    Wait Until Element Is Visible      ${help_button}    timeout=5
    Click Element                      ${help_button}
  
    Wait Until Element Is Visible     ${Write_your_doubt} 
    Input Text                        ${Write_your_doubt}    ${text}
    Click Text                         Enviar