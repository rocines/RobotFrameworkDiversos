***Settings***

Library                 SeleniumLibrary

***Variables***
${URL}                  https://www.amazon.com.br/
${MENU_ELETRONICOS}     //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER}               //a[contains(@aria-label,'Amazon.com.br')]
${ADD_CARRINHO}         //input[contains(@name,'submit.add-to-cart')]
${ADD_CARRINHO_OK}      //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${REMOVER_CARRINHO}     //input[@title='Excluir']
${CARRINHO_VAZIO}       //span[contains(@class,'nav-cart-count nav-progressive-attribute nav-progressive-content nav-cart-0')]
${GARANTIA_NAO}         //input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]

***Keywords***
Abrir o navegador
    Open Browser                        browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                               ${URL}
    Wait Until Element is Visible       ${HEADER}    

Entrar no menu "Eletrônicos"
    Click Element                       ${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Element is Visible       ${HEADER_ELETRONICOS}            

Verificar se o título da página fica "${TITULO}"
    Title Should Be                     ${TITULO}


Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible           //a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text                          twotabsearchtextbox             ${PRODUTO}

Clicar no botão de pesquisa
    Click Element                       nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element is Visible       (//span[contains(.,'${PRODUTO}')])[2]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element                       (//span[contains(.,'${PRODUTO}')])[2]
    Wait Until Element is Visible       ${ADD_CARRINHO}
    Click Element                       ${ADD_CARRINHO}  

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Element is Visible       ${ADD_CARRINHO_OK}

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element is Visible       ${REMOVER_CARRINHO}         timeout=10
    Click Element                       ${REMOVER_CARRINHO}

Verificar se o carrinho fica vazio
    Wait Until Element is Visible       ${CARRINHO_VAZIO}

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
   Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Title Should Be                     Amazon.com.br : Xbox Series S

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Quando pesquisar pelo produto "Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    
Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio