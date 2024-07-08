*** Settings ***
Documentation    Suite de testes de matriculas de alunos
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource


*** Test Cases ***
Deve Matricular um Aluno

    ${admin}    Create Dictionary
    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    pass=qacademy

    Connect To PostGress
    Delete Enroll    6

    Do Login    ${admin}
    Go To Enrolls
    Go To Enroll Form
    Select Student    Falcão Não mexer
    Select Plan       Black
    Fill Start Date    
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso

