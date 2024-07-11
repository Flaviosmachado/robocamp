*** Settings ***
Documentation    Arquivo que representa o popup apos logar


Library    AppiumLibrary

*** Variables ***
${ok_button}    id=android:id/button1 


*** Keywords ***
Confirm PopUp

    Wait Until Element Is Visible      ${ok_button}    timeout=5
    Click Element                      ${ok_button}