***Settings***
Documentation       Suite para exercitar o uso de condições e loops

***Variables***
@{LISTA_NUMEROS}    1   2   3   4   5   6   7   8   9   10

***Test Cases***
Caso de Teste - Imprimir número 5 e 10
    Verificar se o número é 5 ou 10

***Keywords***
Verificar se o número é 5 ou 10
    Log To Console    ${\n}
    FOR     ${CONTADOR}     IN      @{LISTA_NUMEROS}
            IF          ${CONTADOR} == 5        
                    Log To Console      Eu sou o número 5!
            ELSE IF     ${CONTADOR} == 10       
                    Log To Console      Eu sou o número 10! 
            ELSE        
                    Log To Console      Eu não sou o número 5 e nem o 10!
            END
    END