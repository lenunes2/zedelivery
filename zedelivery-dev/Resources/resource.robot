*** Settings ***
Library        SeleniumLibrary
Library        DateTime
Library        String

*** Variables ***
${URL}       https://ze.delivery/
${BROWSER}    chrome

*** Keywords ***
Abrir navegador
    Open Browser   ${URL}   ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser