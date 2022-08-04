***Settings***
Documentation       Exemplo com finalidade de imprimir todos os meses do ano

***Variables***
@{LISTA_MESES}      Janeiro     Fevereiro       Março       Abril       Maio        Junho       Julho       Agosto      Setembro        Outubro     Novembro        Dezembro

&{DIAS_MESES}       Janeiro=31
...                 Fevereiro=28
...                 Março=31
...                 Abril=30
...                 Maio=31
...                 Junho=30
...                 Julho=31
...                 Agosto=31
...                 Setembro=30
...                 Outubro=31
...                 Novembro=30
...                 Dezembro=31

***Test Cases***
Caso de Teste 01 - Imprimir Meses do ano
    Imprimir Meses

Caso de Teste 02 - Imprimir o número de dias de cada mês
    Imprimir Dias

***Keywords***

Imprimir Meses
    Log To Console      Primeiro mês: ${LISTA_MESES[0]}
    Log To Console      Segundo mês: ${LISTA_MESES[1]}
    Log To Console      Terceiro mês: ${LISTA_MESES[2]}
    Log To Console      Quarto mês: ${LISTA_MESES[3]}
    Log To Console      Quinto mês: ${LISTA_MESES[4]}
    Log To Console      Sexto mês: ${LISTA_MESES[5]}
    Log To Console      Sétimo mês: ${LISTA_MESES[6]}
    Log To Console      Oitavo mês: ${LISTA_MESES[7]}
    Log To Console      Nono mês: ${LISTA_MESES[8]}
    Log To Console      Décimo mês: ${LISTA_MESES[9]}
    Log To Console      Décimo Primeiro mês: ${LISTA_MESES[10]}
    Log To Console      Décimo Segundo mês: ${LISTA_MESES[11]}

Imprimir Dias
    Log To Console      Janeiro: ${DIAS_MESES.Janeiro}
    Log To Console      Fevereiro: ${DIAS_MESES.Fevereiro}
    Log To Console      Março: ${DIAS_MESES.Março}
    Log To Console      Abril: ${DIAS_MESES.Abril}
    Log To Console      Maio: ${DIAS_MESES.Maio}
    Log To Console      Junho: ${DIAS_MESES.Junho}
    Log To Console      Julho: ${DIAS_MESES.Julho}
    Log To Console      Agosto: ${DIAS_MESES.Agosto}
    Log To Console      Setembro: ${DIAS_MESES.Setembro}
    Log To Console      Outubro: ${DIAS_MESES.Outubro}
    Log To Console      Novembro: ${DIAS_MESES.Novembro}
    Log To Console      Dezembro: ${DIAS_MESES.Dezembro}