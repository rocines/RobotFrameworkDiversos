***Settings***
Documentation           Arquivo de Resources da API

Library                 RequestsLibrary
Library                 Collections

***Variables***
${URL_API}              https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}              id=15
...                     title=Book 15
...                     description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...                     pageCount=1500
...                     excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n

&{NEW_BOOK}             id=2333     title=teste     description=teste   pageCount=200   excerpt=teste
&{EDIT_BOOK}            id=150      title=Alterando o livro 150     description=Teste com o PUT   pageCount=500   excerpt=teste


***Keywords***
Conectar a minha API
    Create Session      fakeAPI     ${URL_API}   

Requisitar todos os livros
    ${RESPOSTA}         GET On Session      fakeAPI       url=Books
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir o status code
    [Arguments]                     ${STATUSCODE_DESEJADO}  
    Should Be Equal As Strings      ${RESPOSTA.status_code}         ${STATUSCODE_DESEJADO}  

Conferir o Reason
    [Arguments]                     ${REASON_DESEJADO}
    Should Be Equal As Strings      ${RESPOSTA.reason}         ${REASON_DESEJADO}         

Conferir se retornou uma lista com "${QTDE_LIVROS}" livros
    Length Should Be                ${RESPOSTA.json()}                 ${QTDE_LIVROS}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}         GET On Session      fakeAPI       url=Books/${ID_LIVRO}
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir se retorna todos os dados corretos do livro "15"
    Dictionary Should Contain Item          ${RESPOSTA.json()}      id                      ${BOOK_15.id}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      title                   ${BOOK_15.title}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      description             ${BOOK_15.description}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      pageCount               ${BOOK_15.pageCount}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      excerpt                 ${BOOK_15.excerpt}
    Should not Be Empty                     ${RESPOSTA.json()["publishDate"]}

Cadastrar um novo livro
    ${HEADERS}          Create Dictionary   content-type=application/json
    ${RESPOSTA}         POST On Session     alias=fakeAPI     url=Books
...                                                     data={"id": ${NEW_BOOK.id},"title": "${NEW_BOOK.title}","description": "${NEW_BOOK.description}","pageCount": ${NEW_BOOK.pageCount},"excerpt": "${NEW_BOOK.excerpt}","publishDate": "2022-02-27T05:12:11.549Z"}
...                                                     headers=${HEADERS}
    Log                       ${RESPOSTA.text}
    Set Test Variable         ${RESPOSTA}

Conferir os dados do novo livro
    Dictionary Should Contain Item          ${RESPOSTA.json()}      id                      ${NEW_BOOK.id}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      title                   ${NEW_BOOK.title}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      description             ${NEW_BOOK.description}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      pageCount               ${NEW_BOOK.pageCount}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      excerpt                 ${NEW_BOOK.excerpt}
    Should not Be Empty                     ${RESPOSTA.json()["publishDate"]}

Alterar o livro "150"
    ${HEADERS}          Create Dictionary   content-type=application/json
    ${RESPOSTA}         POST On Session     alias=fakeAPI     url=Books
...                                                     data={"id": ${EDIT_BOOK.id},"title": "${EDIT_BOOK.title}","description": "${EDIT_BOOK.description}","pageCount": ${EDIT_BOOK.pageCount},"excerpt": "${EDIT_BOOK.excerpt}","publishDate": "2022-02-27T05:12:11.549Z"}
...                                                     headers=${HEADERS}
    Log                       ${RESPOSTA.text}
    Set Test Variable         ${RESPOSTA}

Conferir se retorna todos os dados alterados do livros "150"
    Dictionary Should Contain Item          ${RESPOSTA.json()}      id                      ${EDIT_BOOK.id}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      title                   ${EDIT_BOOK.title}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      description             ${EDIT_BOOK.description}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      pageCount               ${EDIT_BOOK.pageCount}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      excerpt                 ${EDIT_BOOK.excerpt}
    Should not Be Empty                     ${RESPOSTA.json()["publishDate"]}

Deletar o livro "${EXCLUIR_LIVRO}"
    ${RESPOSTA}         DELETE On Session   alias=fakeAPI     url=Books/${EXCLUIR_LIVRO}                                               
    Log                       ${RESPOSTA.text}
    Set Test Variable         ${RESPOSTA}

Conferir se deleta o livro "200" 
    Should Be Empty                      ${RESPOSTA.text}

Conferir os dados do livro
    [Arguments]     ${LIVRO.id}     ${LIVRO.title}      ${LIVRO.description}        ${LIVRO.pageCount}      ${LIVRO.excerpt}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      id                      ${LIVRO.id}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      title                   ${LIVRO.title}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      description             ${LIVRO.description}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      pageCount               ${LIVRO.pageCount}
    Dictionary Should Contain Item          ${RESPOSTA.json()}      excerpt                 ${LIVRO.excerpt}
    Should not Be Empty                     ${RESPOSTA.json()["publishDate"]}