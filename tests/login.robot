*** Settings ***
Documentation    Suite de testes de autenticacao
...              Administrador deve acessar o portal de gestao de academias 

Resource    ../resources/base.resource


*** Test Cases ***
Login do Administrador
    ${admin}    Create Dictionary
    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    pass=qacademy
   Do Login    ${admin}

Email nao cadastrado
    #[Tags]    Temp
    Go To Login Page
    Fill Credentials       404@smartbit.com    qacademy     
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha invalida
    #[Tags]    Temp
    Go To Login Page
    Fill Credentials       admin@smartbit.com    qacadem
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    Go To Login Page
    Fill Credentials    @.com.br    abc123
    Submit Credentials
    Field Type Should Be Email

Senha em branco
    Go To Login Page
    Fill Credentials    admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória

Email em branco
    Go To Login Page
    Fill Credentials    ${EMPTY}    codecademy
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório

Email e senha obrigatorios
    Go To Login Page
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória
    Alert Text Should Be    email    O e-mail é obrigatório
    