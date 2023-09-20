*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}              https://walkdog.vercel.app/signup 
${BROWSER}          Chrome    
${DELAY}            2s    

*** Keywords ***
Visitante Visita Página de Cadastro
    Open Browser    ${URL}    ${BROWSER}
    Go To    ${URL}
    Set Window Size     1920        1080

Fechar Browser
    Capture Page Screenshot
    Close Browser