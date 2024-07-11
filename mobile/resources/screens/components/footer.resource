*** Settings ***
Documentation    Arquivo que representa o rodapé da tela apos logar


Library    AppiumLibrary

*** Variables ***
${ask_help}    //android.widget.TextView[@text="Pedir ajuda"]


*** Keywords ***
Go to Help Order

    Wait Until Element Is Visible    ${ask_help}      timeout=5
    Click Element                    ${ask_help}