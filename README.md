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





