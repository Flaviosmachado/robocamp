*** Settings ***
Documentation    Suite de testes de matriculas de alunos
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases *** 
Deve Matricular um Aluno

    ${admin}      Get fixture    admin
    ${falcao}     Get fixture    falcao

    Reset student    ${falcao}[student][email]

     ${token}    Get Service Token    ${admin}
     POST New Student    ${token}    ${falcao}[student]
    
    Do Login                ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${falcao}[student][name]
    Select Plan       ${falcao}[enroll][plan]
    Fill Start Date    
    Submit Enrolls form    
    Verify Toaster    Matrícula cadastrada com sucesso



