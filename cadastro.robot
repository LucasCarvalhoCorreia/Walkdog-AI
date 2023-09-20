*** Settings ***
Resource        ${EXECDIR}/resources/base.resource
Resource        ${EXECDIR}/resources/pages/SignupPage.robot

Test Setup      Visitante Visita Página de Cadastro
Test Teardown   Fechar Browser

*** Test Cases ***
Cadastro de Dog Walker com Sucesso
    [Documentation]    Cadastro de Dog Walker com dados válidos
    [Tags]    happy_path

    Preencher Formulário com Dados Válidos      Seu Nome    seuemail@example.com        12345678901     12345-678       123     Apt 101
    Deve Ver Mensagem de Sucesso                Recebemos o seu cadastro e em breve retornaremos o contato.

CPF Incorreto
    [Documentation]    CPF incorreto deve gerar mensagem de alerta
    [Tags]    cpf_inv
    
    Preencher Formulário com CPF Incorreto     12345678900a  
    Deve Ver Mensagem de Alerta                CPF inválido

Email Incorreto
    [Documentation]    Email incorreto deve gerar mensagem de alerta
    [Tags]    email_inv
    
    Preencher Formulário com Email Incorreto        emailincorreto.com
    Deve Ver Mensagem de Alerta                     Informe um email válido

Campos Obrigatórios
    [Documentation]    Campos obrigatórios em branco devem gerar mensagens de alerta
    [Tags]    campos_obrigatorios
    
    Submeter Formulário
    Deve Ver Mensagens de Alerta de Campos Obrigatórios