***Settings***
Library              Browser
Library              FakerLibrary
Library              resources/libs/mongo.py




*** Test Cases ***
Deve cadastrar um novo usuário


    New Browser          browser=chromium        headless=False
    New Page             http://localhost:3000/signup

    Get Text        css=form h1        equal        Faça seu cadastro

    Fill Text       css=input[name=name]        Ariane Pereto
    Fill Text       css=input[name=email]       riri_pereto@hotmail.com
    Fill Text       css=input[name=password]    pwd123
    
    Click           css=button[type=submit] >> text=Cadastrar

    ${notice}       Set Variable        css=.notice p
    ${message}      Set Variable        Boas vindas ao Mark85, o seu gerenciador de tarefas.

    Wait For Elements State    ${notice}    visible    5

    Get Text    ${notice}        equal        ${message}



    
Usuario Duplicado

    New Browser          browser=chromium        headless=False
    New Page             http://localhost:3000/signup

    Get Text        css=form h1        equal        Faça seu cadastro

    Fill Text       css=input[name=name]        Ariane Pereto
    Fill Text       css=input[name=email]       riri_pereto@hotmail.com
    Fill Text       css=input[name=password]    pwd123
    
    Click           css=button[type=submit] >> text=Cadastrar

    ${notice}       Set Variable        css=.notice p
    ${message}      Set Variable        Oops! Já existe um cadastro com e-mail informado.

    Wait For Elements State    ${notice}    visible    5

    Get Text    ${notice}        equal        ${message}






Deve cadastrar um novo usuário apagando o anterior automaticamente

    New Browser          browser=chromium        headless=False
    New Page             http://localhost:3000/signup

    Get Text        css=form h1        equal        Faça seu cadastro

    Remove User By Email        riri_pereto@hotmail.com

    Fill Text       css=input[name=name]        Ariane Pereto
    Fill Text       css=input[name=email]       riri_pereto@hotmail.com
    Fill Text       css=input[name=password]    pwd123
    
    Click           css=button[type=submit] >> text=Cadastrar

    ${notice}       Set Variable        css=.notice p
    ${message}      Set Variable        Boas vindas ao Mark85, o seu gerenciador de tarefas.

    Wait For Elements State    ${notice}    visible    5

    Get Text    ${notice}        equal        ${message}



    

Deve cadastrar um novo usuário dinamicamente
#utiliza FakerLibrary

    New Browser          browser=chromium        headless=False
    New Page             http://localhost:3000/signup

    Get Text        css=form h1        equal        Faça seu cadastro

    ${email}        Free Email

    Fill Text       css=input[name=name]        Ariane Pereto
    Fill Text       css=input[name=email]       ${email}
    Fill Text       css=input[name=password]    pwd123
    
    Click           css=button[type=submit] >> text=Cadastrar

    ${notice}       Set Variable        css=.notice p
    ${message}      Set Variable        Boas vindas ao Mark85, o seu gerenciador de tarefas.

    Wait For Elements State    ${notice}    visible    5

    Get Text    ${notice}        equal        ${message}




Deve cadastrar um novo usuário 2
#utilizando resources/libs/mongo.py

    New Browser          browser=chromium        headless=False
    New Page             http://localhost:3000/signup

    Get Text        css=form h1        equal        Faça seu cadastro

    &{user}    Create Dictionary    name= Carol Falcon        email=ariane_pereto@hotmail.com        password=pwd123

    Remove User By Email        ${user}[email]

    Fill Text       css=input[name=name]        ${user}[name]
    Fill Text       css=input[name=email]       ${user}[email]
    Fill Text       css=input[name=password]    ${user}[password]
    
    Click           css=button[type=submit] >> text=Cadastrar

    ${notice}       Set Variable        css=.notice p
    ${message}      Set Variable        Boas vindas ao Mark85, o seu gerenciador de tarefas.

    Wait For Elements State    ${notice}    visible    5

    Get Text    ${notice}        equal        ${message}



Usuario Duplicado 2
#utilizando a keywords abaixo

    New Browser          browser=chromium        headless=False
    New Page             http://localhost:3000/signup

    Get Text        css=form h1        equal        Faça seu cadastro

    &{user}    Create Dictionary    name= Carol Falcon        email=ariane_pereto@hotmail.com        password=pwd123

    
    Register user        ${user}       
    Register user        ${user}

    ${notice}       Set Variable        css=.notice p
    ${message}      Set Variable        Oops! Já existe um cadastro com e-mail informado.

    Wait For Elements State    ${notice}    visible    5

    Get Text    ${notice}        equal        ${message}


*** Keywords ***
Register user
    [Arguments]        ${user}

    Fill Text       css=input[name=name]        ${user}[name]
    Fill Text       css=input[name=email]       ${user}[email]
    Fill Text       css=input[name=password]    ${user}[password]
    
    Click           css=button[type=submit] >> text=Cadastrar