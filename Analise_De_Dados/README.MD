# Analise em Power BI e Python

![img](/Analise_De_Dados//images_readme/image_readme.png)

## Link para o Dashboard

Acesse o [Dashboard de Análise aqui](./DASHBOARD_POWER_BI/DASHBOARD.pbix).

## Guia para o Dashboard de Análise

Para abrir o Dashboard de Análise no Power BI, siga estas etapas:

1. **Abra o Power BI Desktop:**
   - Baixe gratuitamente o [Power BI Desktop](https://powerbi.microsoft.com/) e instale-o em seu computador, se ainda não o tiver.

2. **Baixe o Arquivo DASHBOARD.pbix:**
   - Faça o download do arquivo "DASHBOARD.pbix" na pasta "DASHBOARD POWER BI" do repositório e abra-o em seu computador.

3. **Atualize a Fonte dos dados:**

   - **Passo 1**: Para obter a versão mais recente do dashboard, na parte de cima da tela em "Página inicial", clique em "Transformar dados".

   - **Passo 2**: Após isso, uma janela chamada "Editor do Power Query" abrirá informando um erro. (Ignore-o)

   - **Passo 3**: Em seguida, clique em Consultas na parte esquerda da janela, e então clique em **dataFolderPath**.

   - **Passo 4**: Copie o caminho absoluto da pasta "Analise_De_Dados"
      - **Passo 4.1**: Para conseguir ele:

   ![img]( /Analise_De_Dados//images_readme/ClicarEmPasta.png )

   ![img]( /Analise_De_Dados//images_readme/Caminho_absoluto.png )

   - **Passo 5**: Dentro do retângulo branco com o texto "Pasta Raiz/Análise de dados" coloque o caminho "absoluto" para a pasta "Analise_De_Dados"

   ![img]( /Analise_De_Dados//images_readme/ColarOCaminho.png )

   - **Passo 6**: Por fim, aperte Enter e **feche a janela pelo X no canto superior direito da tela**.

## Conteúdo do Dashboard

### Página 1:

- A primeira página do dashboard apresenta informações sobre a distribuição de gênero, incluindo:
  - Cidade
  - Quantidade de Usuários por dia
  - Distribuição por Registradores

Para acessar a próxima página, basta clicar na aba na parte inferior da tela do aplicativo.

### Página 2:

- A segunda página do dashboard inclui um mapa que mostra as localizações das cidades de origem dos romeiros.
- A distância entre as cidades de origem e o posto de atendimento foi calculada usando a lei dos cossenos.
- A tabela exibe a distância em quilômetros (KM) de cada cidade em relação ao posto de atendimento.

### Página 3:

- A terceira página contém informações sobre os intervalos de idade dos romeiros, incluindo:
  - Cidade de origem
  - Quantidade por intervalo de idade
  - Estatísticas sobre essa distribuição, como média, mediana, desvio padrão, máximo e mínimo.


## Orientador

- [@Erminio Augusto Ramos da Paixao](http://lattes.cnpq.br/3441462516404507)

## Colaboradores Universitarios

- [@Jean Arthur Costa Dias](https://github.com/JeanArthurCostaDias)
- [@Marco Antonio](https://github.com/marco0antonio0)
