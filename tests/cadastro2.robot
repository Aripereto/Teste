*** Settings ***

Resource        ${EXECDIR}/resources/base.robot    
Library    ../resources/libs/mongo.py

*** Test Cases ***
Deve cadastrar um novo usuário

    &{user}        Create Dictionary
    ...    name=Ariane
    ...    email=ariane@hotmail.com
    ...    password=pwd123
    
        Remove User By Email                ${user}[email]

        Start Session
        Go to signup
        Register user                        ${user}
        Notice should be                     Boas vindas ao Mark85, o seu gerenciador de tarefas.




    
Usuário Duplicado2

    [Tags]    dup
    
        &{user}    Create Dictionary    
    ...    name=Carol Falcon        
    ...    email=ariane_pereto@hotmail.com        
    ...    password=pwd123

        
        Remove User By Email        ${user}[email]

        Start Session
        Go to signup
        Register user        ${user}
        Register user        ${user}
        Notice should be     Oops! Já existe um cadastro com e-mail informado.

# Nome deve ser obrigatório

# Email deve ser obrigatório

# Senha deve ser obrigatório