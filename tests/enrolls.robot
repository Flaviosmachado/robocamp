*** Settings ***
Documentation    Suite de testes de matriculas de alunos
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
Deve Matricular um Aluno

    ${admin}      Get fixture    admin
    ${student}    Get fixture    student

    Reset student enroll    ${student}[email]
    Do Login                ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date    
    Submit Enrolls form    
    Verify Toaster    Matrícula cadastrada com sucesso



