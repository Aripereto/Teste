*** Settings ***

Resource           ${EXECDIR}/resources/base.robot    
Resource        ../resources/pages/signup.robot
Library        ../resources/libs/mongo.py

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
        Insert User                 ${user}

        Start Session
        Go to signup
        Register user        ${user}
        Notice should be     Oops! Já existe um cadastro com e-mail informado.

Nome deve ser obrigatório
        [Tags]    nome_obg
                  
       &{user}=    Create Dictionary    
    ...    name=       
    ...    email=ariane_pereto@hotmail.com        
    ...    password=pwd123

        
        Start Session
        Go to signup
        Register user        ${user}
        Alert should be      Informe seu nome completo

Email deve ser obrigatório

        [Tags]    email_obg

        &{user}=    Create Dictionary    
    ...    name=Ari       
    ...    email=        
    ...    password=pwd123

        
        Start Session
        Go to signup
        Register user        ${user}
        Alert should be    Informe seu e-email

Senha deve ser obrigatório
        [Tags]    senha_obg

        &{user}=    Create Dictionary    
    ...    name=Ari      
    ...    email=ariane_pereto@hotmail.com        
    ...    password=

        
        Start Session
        Go to signup
        Register user        ${user}
        Alert should be    Informe uma senha com pelo menos 6 digitos