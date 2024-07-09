*** Settings ***

Library    SeleniumLibrary
Library    Dialogs



*** Variables ***
${url}        https://www.geradordecpf.org/
${browser}    chrome






*** Test Cases ***
Verificar CPF válido
    Dado que o usuário queira gerar um CPF válido
    Quando acessar o site para gerar um CPF 
    E clicar no botão que gera o CPF
    Então o sistema deve gerar o CPF


*** Keywords ***
Dado que o usuário queira gerar um CPF válido
    Open Browser    ${url}        ${browser}     options=add_experimental_option("detach",True)         
    Sleep    1    
    Maximize Browser Window
Quando acessar o site para gerar um CPF 
    Click Element    //input[contains(@type,'checkbox')]
    Wait Until Element Is Visible    //input[contains(@value,'Gerar CPF')]
    Log To Console    Botão encontrado.

E clicar no botão que gera o CPF
    Wait Until Element Is Visible    //input[contains(@value,'Gerar CPF')]        20
    Click Element    //input[contains(@value,'Gerar CPF')]
Então o sistema deve gerar o CPF
    ${cpf}    Get Value    //input[contains(@class,'form-control input-lg m-b text-center')]
    Log To Console    CPF:${cpf}
    Capture Page Screenshot
    Sleep    3
    Close Browser


