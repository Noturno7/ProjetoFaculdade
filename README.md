# PT-BR <img width="48" height="48" src="https://img.icons8.com/emoji/48/brazil-emoji.png" alt="brazil-emoji"/>
# ProjetoFaculdade📘
Neste projeto da faculdade foi me dada a tarefa de criar um projeto de banco de dados relacional que permita armazenar e fornecer informações sobre o preço dos combustíveis da minha região.

## Sobre o projeto 📈
O projeto será dividido em duas partes:
1. Projeto conceitual: Será apresentado um projeto conceitual completo que atenda todos os requisitos elencados no item 2, mostrando todas as entidades, relacionamento (e respectivas cardinalidades), restrições , chaves primarias etc... 
2. Projeto lógico e físico: O projeto conceitual montado na etapa anterior deve ser convertido em um projeto lógico e físico e implementado usando o SGBD postgress. 
*a. A implementação deve seguir estritamente o que foi proposto no projeto conceitual.* 
*b. O projeto deve conter todas as restrições, relacionamento, chaves primarias proposto no projeto conceitual, além de especificar índices criados em cada tabela, tipo de índice utilizado etc..*

## Restrições e pendencias⚠️
**A**. O projeto conceitual.

**B**. O backup do banco de dados montado e devidamente povoado. (o backup deve estar funcional, permitindo que seja anexado ao SGBD do professor para correção).

**C**. O backup do banco de dados deve ser completo, com todas as store procedures, function índices e relacionamentos usados.

**D**. Imagem da apresentação dos resultados para pessoas da sua comunidade (fotos dos gráficos e materiais disponibilizados). 

## Requisitos do Banco de Dados📝
**A**.  Coleta de preços de pelo menos 6 postos de gasolina (em cidades onde exista poucos postos, será aceita a coleta em apenas 3 postos – JUSTIFICAR e informar a cidade.  Para os seguintes combustíveis:
i. Gasolina. 
ii. Gasolina Aditivada. 
iii. Etanol.
iv. Diesel.  

**B**. Deve haver no mínimo 10 coletas de cada posto, sempre em datas diferentes.

**C**. Os postos devem englobar pelo menos 2 bairros da cidade.

**D**. As tabelas criadas devem estar na 3ª. Forma Normal.

**E**. O Banco de dados deve oferecer no mínimo as seguintes consultas para usuários do banco de dados: 

**F**. Uma Store Procedure que retorne ao usuário o menor preço de cada combustível , contendo no mínimo os seguintes dados: nome posto, endereço, bairro, valor dos combustíveis, data da coleta). 

**G**. Store procedure deve permitir dois parâmetros opcionais indicando um bairro e um combustível especifico.  
**H**. Quando o usuário informar algum parâmetro, a consulta deve considerar somente os dados que atendam os parâmetros informados, quando não for informado os parâmetros, a consulta  considera todos os dados. 
 ii. Uma Store Procedure retorne o preço médio geral ou o preço médio de um bairro especifico de todos os combustíveis. 
 
**I**. O usuário pode fornecer de forma opcional um período especifico. 
 iii. Uma Store Procedure que retorne uma listagem que mostre o nome de cada posto, o bairro, a quantidade de amostras deste posto e o preço médio e cada combustível.
 
**J**. O usuário deve fornecer como parâmetro um período (data inicial e data final). 

## Requisito EXTRA📣
**F.** Para usuários leigos (sem acesso ao banco de dados) deve ser disponibilizado planilhas que forneçam os mesmos dados acima, acrescido dos seguintes artefatos: 
i. Gráfico com a evolução do preço médio de cada combustível. 
ii. Gráfico com a evolução do preço médio de cada combustível em cada posto. 
**G**. Os dados devem ser disponibilizados (em planilhas) para a comunidade local. 

**OBS**->*O compartilhamento com a comunidade também é um requisito.*

# ENG-EUA    <img width="48" height="48" src="https://img.icons8.com/emoji/48/united-states-emoji.png" alt="united-states-emoji"/>
# CollegeProject📘
In this college project, I was given the task of creating a relational database project that allows me to store and provide information about fuel prices in my region.

## About the project 📈
The project will be divided into two parts:

1. Conceptual project: A complete conceptual project will be presented that meets all the requirements listed in item 2, showing all entities, relationships (and respective cardinalities), restrictions, primary keys, etc.

2. Logical and physical project: The conceptual project assembled in the previous step must be converted into a logical and physical project and implemented using the postgress DBMS.

*a. The implementation must strictly follow what was proposed in the conceptual project.*

*b. The project must contain all the restrictions, relationships, primary keys proposed in the conceptual project, in addition to specifying indexes created in each table, type of index used, etc.*

## Restrictions and pending issues⚠️
**A**. The conceptual project.

**B**. The backup of the database, mounted and properly populated. (The backup must be functional, allowing it to be attached to the teacher's DBMS for correction).

**C**. The database backup must be complete, with all stored procedures, functions, indexes and relationships used.

**D**. Image of the presentation of the results to people in your community (photos of the graphs and materials provided).

## Database Requirements📝
**A**. Price collection from at least 6 gas stations (in cities where there are few gas stations, collection from only 3 gas stations will be accepted – JUSTIFY and inform the city. For the following fuels:
i. Gasoline.
ii. Additive Gasoline.
iii. Ethanol.
iv. Diesel.

**B**. There must be at least 10 collections from each gas station, always on different dates.

**C**. The gas stations must cover at least 2 neighborhoods in the city.

**D**. The tables created must be in 3rd Normal Form.

**E**. The database must offer at least the following queries for database users:

**F**. A Store Procedure that returns the lowest price for each fuel to the user, containing at least the following data: gas station name, address, neighborhood, fuel price, collection date).

**G**. Store procedure must allow two optional parameters indicating a neighborhood and a specific fuel. 
**H**. When the user enters a parameter, the query must consider only the data that meets the parameters provided. When no parameters are provided, the query considers all the data.
ii. A Store Procedure returns the overall average price or the average price of a specific neighborhood for all fuels. 

**I**. The user may optionally provide a specific period. 

iii. A Store Procedure that returns a list showing the name of each gas station, the neighborhood, the number of samples from this gas station, and the average price for each fuel. 

**J**. The user must provide a period (start date and end date) as a parameter. 

## EXTRA Requirement📣
**F.** For lay users (without access to the database), spreadsheets must be made available that provide the same data above, plus the following artifacts: 

i. Graph showing the evolution of the average price of each fuel. 

ii. Graph showing the evolution of the average price of each fuel at each gas station. 

**G**. The data must be made available (in spreadsheets) to the local community. 

**OBS**->*Sharing with the community is also a requirement.*





