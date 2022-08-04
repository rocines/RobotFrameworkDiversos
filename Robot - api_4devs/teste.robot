*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${URL_API}     https://www.4devs.com.br/
&{body}     acao=gerar_pessoa       pontuacao=N     sexo=H
&{header}   Content-Type=application/json

*** Keywords ***
Dado que tenha sido realizado o POST na API 4DEVS
    Create Session      API4DEVS      ${url_api}     
E tenha retornado o ResponseBody
    ${RESPOSTA}=    POST On Session    API4DEVS    ferramentas_online.php     data=${body}
    Set Global Variable      ${RESPOSTA}
Então deve retornar o status code 200      
    ${code}=    Convert To String    ${RESPOSTA.status_code}
    Should Be Equal      ${code}    200
    Log To Console      ${code}  
E tenha sido obtido o valor do campo Idade
    ${idade}=    Convert To String    ${RESPOSTA.json()["idade"]}
    Set Global Variable     ${idade}
Então deve ser verificado se campo Idade consta no ResponseBody
    Variable Should Exist      ${idade}
E tenha sido obtido o valor do campo Sexo
    ${sexo}=    Convert To String    ${RESPOSTA.json()["sexo"]}
    Set Global Variable     ${sexo}
Então o campo Sexo deve ser igual a Masculino
    Should Be Equal As Strings      ${sexo}    Masculino
Quando o valor do campo CPF for gravado na variável CPF
    ${cpf}=    Convert To String    ${RESPOSTA.json()["cpf"]}
    Set Global Variable     ${cpf}
Então deve retornar o valor da variável CPF 
    Log To Console      ${cpf}
Então deve retornar o valor da variável CPF vazio
    ${cpf}=     Replace Variables       ${EMPTY}  
    Log To Console      ${cpf}
    
*** Test Cases ***
Validar o campo Status Code (Resultado esperado deve ser 200)
    Dado que tenha sido realizado o POST na API 4DEVS
    E tenha retornado o ResponseBody
    Então deve retornar o status code 200
Validar se o campo Idade consta do ResponseBody (Resultado esperado deve ser Sucesso)
    Dado que tenha sido realizado o POST na API 4DEVS
    E tenha sido obtido o valor do campo Idade
    Então deve ser verificado se campo Idade consta no ResponseBody 
Validar se o valor do campo sexo do ResponseBody é igual a Masculino (Resultado esperado deve ser Sucesso)
    Dado que tenha sido realizado o POST na API 4DEVS
    E tenha sido obtido o valor do campo Sexo
    Então o campo Sexo deve ser igual a Masculino
Armazenar o campo CPF do ResponseBody em uma variável nomeada CPF
    Dado que tenha sido realizado o POST na API 4DEVS
    Quando o valor do campo CPF for gravado na variável CPF
    Então deve retornar o valor da variável CPF
Limpar a variável CPF
    Dado que tenha sido realizado o POST na API 4DEVS
    Quando o valor do campo CPF for gravado na variável CPF
    Então deve retornar o valor da variável CPF vazio