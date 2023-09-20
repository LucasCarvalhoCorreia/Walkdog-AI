Construa testes automatizados com a ferramenta Robot Framework, conforme as orientações abaixo:

Funcionalidade: Cadastro de Dog Walkers

    Sendo um visitante do site que curte cuidar de pets
    Posso fazer meu cadastro como Dog Walker
    Para que eu possa ter uma nova fonte de renda com essas atividades

Modelagem de dados:
| Seletor CSS                   | Nome do Campo       | Habilitado | Obrigatório |
|-------------------------------|---------------------|------------|-------------|
| input[name="name"]            | Nome completo       | Sim        | Sim         |
| input[name="email"]           | E-mail              | Sim        | Sim         |
| input[name="cpf"]             | CPF                 | Sim        | Sim         |
| input[name="cep"]             | CEP                 | Sim        | Sim         |
| input[name="addressStreet"]   | Rua                 | Não        | Sim         |
| input[name="addressNumber"]   | Número              | Sim        | Sim         |
| input[name="addressDetails"]  | Complemento         | Sim        | Não         |
| input[name="addressDistrict"] | Bairro              | Não        | Sim         |
| input[name="addressCityUf"]   | Cidade/UF           | Não        | Sim         |
| input[name="file"]            | Upload do documento | Sim        | Sim         |

Outros elementos da pagina de cadastro:
Para submeter o formulário de cadastro do dog walker, é importante clicar no botão "Cadastrar"
O upload do documento sera feito com um arquivo document.png

Cenários de aceite:

Contexto:
    Dado que visito o site Walkdog
    E que desejo me tornar Dog Walker

Cenário: Cadastro de dog walker com sucesso

    Quando submeto o formulário de cadastro com os meus dados pessoais
    Então devo ver uma mensagem de sucesso informando que meu cadastro foi para análise

Cenário: CPF incorreto

    Quando submeto o formulário informando um cpf incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "CPF inválido"

Cenário: Email incorreto

    Quando submeto o formulário informando um email incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "Informe um email válido"

Cenário: Campos obrigatórios

    Quando submeto o formulário sem preencher nenhum dos campos
    Então deve ver mensagens de alerta avisando que esses campos são obrigatórios