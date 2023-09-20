*** Settings ***
Documentation       Aquivo que representa a pagina de cadastro com as ações.

Library     SeleniumLibrary

*** Keywords ***
Preencher Formulário com Dados Válidos
    [Arguments]     ${Nome}     ${Email}        ${CPF}      ${CEP}      ${Número}       ${Complemento}
    Input Text    css=input[name="name"]              ${Nome}
    Input Text    css=input[name="email"]             ${Email}
    Input Text    css=input[name="cpf"]               ${CPF}
    Input Text    css=input[name="cep"]               ${CEP}
    Input Text    css=input[name="addressNumber"]     ${Número}
    Input Text    css=input[name="addressDetails"]    ${Complemento}
    Upload de Documento    ${EXECDIR}/fixtures/br.png

    Submeter Formulário

Preencher Formulário com CPF Incorreto
    [Arguments]     ${CPFIncorreto}
    Input Text    css=input[name="cpf"]    ${CPFIncorreto}
    Submeter Formulário

Preencher Formulário com Email Incorreto
    [Arguments]     ${EmailIncorreto}
    Input Text    css=input[name="email"]    ${EmailIncorreto}
    Submeter Formulário

Upload de Documento
    [Arguments]    ${Documento}
    Choose File    css=input[type="file"]    ${Documento}

Submeter Formulário
    Click Button    Cadastrar

Deve Ver Mensagem de Sucesso
    [Arguments]    ${mensagem}

    ${element}      Set Variable        xpath=//div[@class="swal2-html-container"]

    Wait Until Element Is Visible   ${element}      5
    Element Should Be Visible       ${element}
    Element Should Contain         ${element}      ${mensagem}

Deve Ver Mensagem de Alerta
    [Arguments]    ${mensagem}
    Wait Until Page Contains Element    xpath=//span[@class="alert-error"][text()="${mensagem}"]
    Page Should Contain Element    xpath=//span[@class="alert-error"][text()="${mensagem}"]
    Capture Element Screenshot      xpath=//span[@class="alert-error"][text()="${mensagem}"]
    Capture Page Screenshot     Campos_Obrigatorios.png

Deve Ver Mensagens de Alerta de Campos Obrigatórios
    ${campos_obrigatorios}    Create List    Informe o seu nome completo    Informe o seu melhor email    Informe o seu CPF    Informe o seu CEP    Informe um número maior que zero    Adcione um documento com foto (RG ou CHN)
    FOR    ${campo}    IN    @{campos_obrigatorios}
        Deve Ver Mensagem de Alerta    ${campo}
    END