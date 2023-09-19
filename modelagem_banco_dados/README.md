"

# Modelagem de Dados - Projeto Cirio 2023

Este README descreve a modelagem de dados utilizada no Projeto Cirio 2023 para as tabelas `Tabela_Usuario` e `TABELA_ROMEIROS`. Essas tabelas são essenciais para armazenar informações sobre os participantes cadastrados e os romeiros que participarão do evento Cirio 2023.

## Tabela `Tabela_Usuario`

A tabela `Tabela_Usuario` é responsável por armazenar informações sobre os usuários que estão cadastrando participantes no evento Cirio 2023.

### Estrutura da Tabela `Tabela_Usuario`

| Campo      | Tipo de Dado | Descrição                            |
| ---------- | ------------ | ------------------------------------ |
| `ID`       | INTEGER      | Chave primária única do usuário.     |
| `ID_UNICO` | TEXT         | Identificador único do usuário.      |
| `NOME`     | VARCHAR(100) | Nome completo do usuário.            |
| `TELEFONE` | VARCHAR(100) | Número de telefone do usuário.       |
| `BLOCO`    | VARCHAR(100) | Bloco ou setor associado ao usuário. |

## Tabela `TABELA_ROMEIROS`

A tabela `TABELA_ROMEIROS` é responsável por armazenar informações sobre os romeiros cadastrados para o evento Cirio 2023.

### Estrutura da Tabela `TABELA_ROMEIROS`

| Campo           | Tipo de Dado | Descrição                                 |
| --------------- | ------------ | ----------------------------------------- |
| `ID`            | INTEGER      | Chave primária única do romeiro.          |
| `Usuario_ID`    | VARCHAR(100) | Chave estrangeira relacionada ao usuário. |
| `NOME`          | VARCHAR(100) | Nome completo do romeiro.                 |
| `IDADE`         | INT          | Idade do romeiro.                         |
| `MEDICAMENTO`   | VARCHAR(100) | Medicamento associado ao romeiro.         |
| `CIDADE_ORIGEM` | VARCHAR(100) | Cidade de origem do romeiro.              |
| `SEXO`          | VARCHAR(100) | Gênero ou sexo do romeiro.                |

## Diagrama de Entidade-Relacionamento (DER)

Aqui está um diagrama de Entidade-Relacionamento (DER) que ilustra a relação entre as tabelas `Tabela_Usuario` e `TABELA_ROMEIROS`:

![img](/images_readme/image_1.png)
