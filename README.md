# Trabalho-Base-de-Dados-II---Gestor-de-Passagens-Aereas

## Resumo
---
O trabalho prático da disciplina de Base de Dados II, no qual o tema escolhido
pelo grupo foi “Software de Reserva e Gestão de Passagens Aéreas”, propõe através
do estudo sobre os tópicos lecionados, abranger todos eles e compreender a
importância de cada um para otimização no que se refere a criação e gestão de base
de dados. Para isso, foram usadas tecnologias como: criação de stored procedures,
triggers, users e roles, tudo isso utilizando como linguagem de programação SQL e a
extensão dessa linguagem Transact-SQL, proprietária da Microsoft e Sybase, através
do sgbd SQL Server para o desenvolvimento de uma base de dados otimizada, fiável
e segura para o problema abordado.

 ## Descrição do Problema
---
Este caso de estudo baseia-se no desenvolvimento de um software para uma
companhia aérea. Sendo assim, o software desenvolvido se encarregará de reservar,
gerir a reserva e fazer check-in. O software permitirá que as reservas sejam feitas
tanto para passagens individuais quanto para pacotes de viagens.
Planeja-se desenvolver um software de reserva e gestão de passagens aéreas
e pacotes de viagens para a companhia aérea DB Airlines. No aeroporto, o cliente
dirige-se ao setor da companhia aérea e solicita a reserva de passagens aéreas ou
pacotes de viagem, para isso o(a) atendente do setor solicita ao cliente nome,
passaporte, morada, data de nascimento, datas de voo e classe de voo. Em caso de
a reserva for realizada online o usuário terá que criar uma conta e inserir seu e-mail e
uma palavra passe e após de ser criada a conta e efetuado o login, a reserva poderá
ser feita utilizando seu nome, passaporte, morada, data de nascimento, e-mail, datas
de voo e classe de voo. Por fim, o software proposto tem como finalidade também a
de gerir a reserva, sendo assim é necessário apenas que o usuário entre no sistema,
e em caso do usuário escolher fazer a gestão de suas reservas ele poderá alterar
datas de voo e/ou a classe do voo de sua reserva.
O cliente poderá realizar diversas reservas, cada uma pertencendo a uma
viagem de destino igual ou diferente. Além disso, para a realização do check-in este
poderá ser realizado pessoalmente no setor da companhia aérea no aeroporto com o
número de passaporte do passageiro ou online através da aplicação da companhia
aérea fornecendo também o passaporte do respectivo usuário e e-mail, no qual neste
último receberá um código de confirmação de check-in e posteriormente deverá ser
inserido na aplicação para finalização do check-in online.
## Instalação do Repositório 
---
$ git clone https://github.com/PatrickSilvaMenezes/Trabalho-Base-de-Dados-II---Gestor-de-Passagens-Aereas.git

## Passos para adicionar ao SQL Server  
---
    1 - Deve-se ter o SQL Server instalado

    2 - Deve-se passar para a pasta DATA aonde está intalado o SQL Server os arquivos .mdf e .ldf
    
    3 - Fazer o attach dos dois arquivos .mdf e .ldf no SQL Server

## Conclusão e Resultados Finais
---
Diante do desenvolvimento do trabalho prático da disciplina de Base de Dados
II, foi possível perceber com mais clareza a importância do uso de triggers e stored
procedures, para a criação e gestão de base de dados, de forma que os processos de
inserção, remoção e atualização de dados se tornam mais otimizados. Além disso, há
um ganho no desempenho tanto em tempo quanto processamento de informações,
ao serem criados triggers para certos processos como atualização de dados em
tabelas, cálculos sobre dados nas tabelas, entre outros, visto que através de uma
manipulação de dados é possível executar mais de um processo de uma vez. E
ainda, o uso de stored procedures possibilita um ganho significativo na performance e
segurança dos processos executados, isto é, se pensados e desenvolvidos de
maneira correta. Por outro lado, ainda foi possível perceber a importância da criação
de users e roles para garantir a segurança e integridade dos dados na database, de
maneira que só quem possui os privilégios garantidos pode de alguma forma
manipular os dados respectivos às tabelas que determinado usuário tiver acesso. Por
fim, conclui-se que o uso dessas tecnologias (stored procedures e triggers) otimizam
o desempenho não só na database, mas também para o caso de um sistema de uma
empresa, por exemplo nas requisições que o back-end faz à database, tornando o
processo mais simples, econômico, legível e com melhor performance.

## Referências
---
[DevMedia](https://www.devmedia.com.br/vantagens-da-utilizacao-de-stored-procedure
s-em-aplicativos-web-para-melhoria-de-performance-e-seguranca/14540)
[MicrosoftDeveloperNetwork](https://social.msdn.microsoft.com/Forums/pt-BR/551a44c7-c763-44dd-8cc9-b4c1bcc48faf/dvidas-sobre-triggers-e-desempenho?forum=520)
[StackOverflow](https://stackoverflow.com/)
[CodeProject](https://www.codeproject.com/)
[Junior Galvão – MVP – Data Platform](https://pedrogalvaojunior.wordpress.com/2008/08/15/eliminando-o-cache-de-memoria-no-sql-server/)