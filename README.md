# Projeto de Engenharia de Dados com Inside Airbnb

Este repositório contém o código e a documentação associada ao projeto de Analytics Engineer com o conjunto de dados "Inside Airbnb" e faz parte da avaliação de competências do módulo Analytics Engineering fa Formação em Engenharia de Dados - Santander Coders - Ada.

## Sobre o Conjunto de Dados

O conjunto de dados "Inside Airbnb", disponível no website [Inside Airbnb](http://insideairbnb.com/), é uma valiosa fonte de informações sobre listagens de hospedagem, avaliações de hóspedes e disponibilidade de calendário em várias cidades ao redor do mundo, incluindo o Rio de Janeiro.

### Principais Componentes do Conjunto de Dados

1. **Listing (Listagem):** Este conjunto de dados contém informações detalhadas sobre as propriedades listadas no Airbnb. Cada registro representa uma listagem individual e inclui informações como o tipo de propriedade, preço, localização, número de quartos, comodidades oferecidas e muito mais.

2. **Reviews (Avaliações):** O conjunto de dados de avaliações contém informações sobre as avaliações feitas por hóspedes que ficaram nas propriedades listadas. Ele inclui dados como a data da avaliação, o identificador da propriedade, os comentários escritos pelos hóspedes, e outras informações. 

3. **Calendar (Calendário):** Este conjunto de dados contém informações sobre a disponibilidade das propriedades ao longo do tempo. Ele lista as datas em que as propriedades estão disponíveis para reserva, bem como os preços para cada data.

O dicionário dos dados também está disponível no website: [Dicionário Inside Airbnb]([http://insideairbnb.com/](https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit#gid=1322284596)).

## Visão Geral do Projeto

Neste projeto, os arquivos de listing, reviews e calendar do Rio de Janeiro foram extraídos através de web scraping utilizando a biblioteca Beautiful Soup. Em seguida, foram carregados em um banco de dados PostgreSQL no schema "raw" (camada bronze). 

Posteriormente, os tratamentos de valores nulos, duplicados, outliers, tipos de colunas e limpeza de textos foram realizados nos DataFrames usando a biblioteca pandas. 

Para analisar a qualidade dos dados e criar expectativas para uso futuro, foi utilizada a biblioteca Great Expectations. Great Expectations proporciona uma estrutura para validar, documentar e monitorar a qualidade dos dados.
![Texto Alternativo](imagens/great_expectation.png)

Após o tratamento e análise da qualidade dos dados, eles foram carregados para o schema "trusted" (camada prata).

Na última etapa do projeto, a ferramenta dbt foi utilizada para realizar a junção de dados das tabelas "listing" e "reviews" e carregar esses dados na camada "spec" (camada ouro). O dbt é uma ferramenta de modelagem de dados e orquestração que permite transformar, documentar e testar os dados antes de serem carregados em um data warehouse.

# Executando o Projeto

Para executar este projeto, siga os passos abaixo:

## Requisitos

Certifique-se de ter todas as bibliotecas e dependências necessárias instaladas. Elas estão listadas no arquivo `requirements.txt`. Para instalá-las, execute o seguinte comando:

```bash
pip install -r requirements.txt
```

O arquivo `requirements.txt` contém uma lista de todas as bibliotecas e versões específicas necessárias para este projeto.

## Configuração das Variáveis de Ambiente

Algumas configurações sensíveis, como credenciais de banco de dados, devem ser gerenciadas usando variáveis de ambiente. Para facilitar isso, crie um arquivo `.env` na raiz do projeto e adicione as variáveis necessárias, por exemplo:

```bash
DB_HOST=seu_host
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
```

Lembre-se de adicionar o arquivo `.env` ao seu arquivo `.gitignore` para evitar que informações sensíveis sejam compartilhadas no repositório.

## Configuração do dbt

O arquivo `.dbt/profiles.yml` também é crucial para configurar as credenciais do banco de dados e outras informações relevantes para o dbt. Certifique-se de que este arquivo esteja presente e que as credenciais estejam corretamente configuradas.

```yml
your_profile_name:
  target: dev
  outputs:
    dev:
      type: postgres
      host: seu_host
      user: seu_usuario
      pass: sua_senha
      port: 5432
      dbname: seu_banco_de_dados
      schema: trusted
```

Substitua `your_profile_name`, `seu_host`, `seu_usuario`, `sua_senha`, `seu_banco_de_dados` com as informações específicas do seu ambiente.

## Executando o Projeto

Agora que todas as configurações foram feitas, você pode executar o projeto. Siga os passos descritos na documentação para cada etapa do projeto.

## Observações Adicionais

Lembre-se de sempre manter suas credenciais e informações sensíveis seguras e não compartilhá-las em locais públicos ou repositórios. Use métodos seguros, como variáveis de ambiente, para gerenciá-las. Além disso, mantenha o controle de versão dos arquivos `.env` e `profiles.yml` para garantir que as configurações corretas sejam utilizadas em cada ambiente.

Caso haja mais detalhes ou considerações específicas para o seu projeto, sinta-se à vontade para adicioná-las a esta seção.

