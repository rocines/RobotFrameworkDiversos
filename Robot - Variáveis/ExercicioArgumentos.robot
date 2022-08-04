***Settings***
Documentation       Este arquivo tem como finalidade trabalhar keywords com argumentos
Library             FakerLibrary

***Variables***
&{PESSOA}           nome=Rocines        sobrenome=Neto        

***Test Cases***
Caso de Teste - Gerar email aleatorio
    Imprimir Email      ${PESSOA.nome}      ${PESSOA.sobrenome}

***Keywords***
Gerar Email
    [Arguments]         ${NOME}      ${SOBRENOME}
    ${RANDOM_WORD}      FakerLibrary.Word
    ${EMAIL_GERADO}     Set Variable        ${NOME}${SOBRENOME}${RANDOM_WORD}@testerobot.com 
    [Return]            ${EMAIL_GERADO}   

Imprimir Email
    [Arguments]         ${PESSOA.nome}      ${PESSOA.sobrenome}
    ${EMAIL}            Gerar Email         ${PESSOA.nome}      ${PESSOA.sobrenome}
    Log To Console      ${EMAIL}
    