*** Settings ***

Library             RequestsLibrary
Library             Collections
Library             String
Library             DateTime
Library             OperatingSystem
Resource           ../Resources/resource.robot
Resource           ../PO/cadastro.robot

Suite Setup         Abrir navegador
Suite Teardown      Fechar navegador

*** Test Cases ***

CSB-4776: Cadastrar usuário
    [Documentation]  Cadastro Novo usuário
    [Tags]  CSB-4776
    Dado que estou na pagina de Cadastro
    Quando eu preencho todos os campos
    E seleciono o checkbox
    E clico no botão para criar conta