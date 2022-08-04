***Settings***
Documentation           Documentação da API - https://fakerestapi.azurewebsites.net/index.html

Resource                ResourceAPI.robot

Suite Setup             Conectar a minha API

***Variables***

***Test Cases***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o status code                              200 
    Conferir o Reason                                   OK
    Conferir se retornou uma lista com "200" livros     

Buscar um livro específico (GET em todos os livros)
    Requisitar o livro "15"
    Conferir o status code                              200 
    Conferir o Reason                                   OK
    Conferir se retorna todos os dados corretos do livro "15"

Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir o status code                              200
    Conferir o Reason                                   OK                
    Conferir os dados do livro                   2333    teste   teste   200     teste

Alterar um livro (PUT)
    Alterar o livro "150"
    Conferir o status code                              200
    Conferir o Reason                                   OK  
    Conferir os dados do livro                  150  Alterando o livro 150  Teste com o PUT  500  teste

Deletar um livro (DELETE)
    Deletar o livro "200"
    Conferir o status code                              200
    Conferir o Reason                                   OK  
    Conferir se deleta o livro "200" 