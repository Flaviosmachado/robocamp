*** Settings ***
Documentation    Keywords que reprensentam a pagina de cadastro da matricula

Library    Browser
Library    libs/DateTricks.py

#Estrategia para pegar um html onde nao aparece no inspecionar
    #${temp}    Get Page Source
    #Log    ${temp}

*** Keywords ***
Go To Enrolls
    Click    css=a[href="/matriculas"]

Go To Enroll Form
    Click    css=a[href="/matriculas/new"]

Select Student
    [Arguments]    ${student_name}
    Fill Text    xpath=//div[contains(text(), "nome do aluno")]/..//input
    ...    ${student_name}
    Click    css=div[class$=option] >> text=${student_name}

Select Plan
    [Arguments]    ${plan_name}
    Click    xpath=//label[text()="PLANO"]/..//div[contains(text(), "Selecione")]
    Click    css=div[class$=option] >> text=${plan_name}


Fill Start Date
 
    Focus    css=input[name=start_date]

    ${start_date}    Get Start Date

    FOR  ${number}  IN  @{start_date}
        Keyboard Key    press    ${number}
    END

Submit Enrolls form
    Click    css=button >> text=Salvar

    