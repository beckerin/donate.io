# Lista de requerimentos

### Campanha

#### Dados
 NOME          | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO 
 ---           | ---        | ---       | ---         | ---      | --- 
id_campanha_pk | `integer`  | `default` | SIM         | SIM      | Id principal da campanha.  
titulo         | `varchar`  | `256`     | SIM         | SIM      | Titulo da campanha.
descricao      | `varchar`  | `1024`    | SIM         | SIM      | Descição da campanha em detalhes.
meta           | `integer`  | `default` | SIM         | SIM      | Meta da campanha.
realizado      | `boolean`  | `default` | SIM         | SIM      | Variável para definir se a campanha foi ou nao concluida.
data_criado    | `Date`     | `default` | SIM         | SIM      | Data que a campanha foi criada.
data_prazo     | `Date`     | `default` | SIM         | SIM      | Data de conclusão da campanha.
data_verificado| `Date`     | `default` | SIM         | SIM      | Data que a doação foi solicatada.
||
id_usuario_fk  | `integer`  | `default` | SIM         | SIM      | [Id do Author](#Usuários)

#### Funções
- Poderão ser criadas `APENAS` por `Usuários` previamente cadastrados.
- Poderão ser alteradas por necessidade ou para complementar informação a mesma necessita aprovação do `Administrador`.
- Poderão ter o seu prazo alterado para finalização imediata, caso tenha o seu objetivo alcançado.
- `Campanhas` não poderão ser apagadas, apenas a sua visibilidade será alterada.


- Podem ter `comentários`:
  - Textos, Fotos ou Vídeos.


- Podem ser feitos `saques`:
  - O tipo de `Saque` deve ser informado previamente.
  - `diários`, `semanais`, `mensalmente` ou `uma única` vez no final da campanha.


- Caso a `campanha` não consiga ser `completa` monetariamente, as `doações` devem:
  - Voltar aos seus `Doadores`.
  - Ficar com o `Autor` da `Campanha`

### Doacao
#### Dados
NOME                  | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---                  | ---        | ---       | ---         | ---      | --- 
id_doacao_pk          | `integer`  | `default` | SIM         | SIM      | ID da doação
valor_centavos        | `integer`  | `default` | SIM         | SIM      | Valor da doação
mensagem              | `varchar`  | `1024`    | NAO         | SIM      | Mensagem embutida na doação.
data_criado           | `Date`     | `default` | SIM         | SIM      | Data que a doação foi solicatada.
data_concluido        | `Date`     | `default` | NAO         | SIM      | Data que a doação foi concluida.
||
id_status_pagamento_fk| `integer`  | `default` | SIM         | SIM      | [ID do tipo de pagamento](#status-de-pagamento)
id_tipo_pagamento_fk  | `integer`  | `default` | SIM         | SIM      | [ID do tipo de pagamento](#tipo-de-Pagamento)
id_campanha_fk        | `integer`  | `default` | SIM         | SIM      | [Id do Campanha](#campanha)
id_usuario_fk         | `integer`  | `default` | SIM         | SIM      | [Id do Usuário](#usuários)


### Status de Pagamento
#### Dados
NOME                | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---                | ---        | ---       | ---         | ---      | --- 
id_tipo_pagamento_pk| `integer`  | `default` | SIM         | SIM      | ID do status de pagamento.
descricao           | `varchar`  | `1024`    | SIM         | SIM      | Descrição do status de pagamento. 

### Função
- Será responsavel por avaliar caso a doação está:
    - 0 -`Pendente` — o pagamento foi recebido, porém, não processado.
    - 1 -`Reembolsado` — o pagamento foi reembolsado pelo doador.
    - 2 -`Concluido` — o pagamento foi concluído e está disponível para ser sacado.
    - 3 -`Expirado` — o pagamento foi requisitado, porém, expirado e não concluído.
    - 4 -`Recusado` — o pagamento foi recusado por algum motivo fora das nossas dependências.

### Tipo de Pagamento
#### Dados
NOME                | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---                | ---        | ---       | ---         | ---      | --- 
id_tipo_pagamento_pk| `integer`  | `default` | SIM         | SIM      | ID do tipo de pagamento
descricao           | `varchar`  | `16`      | SIM         | SIM      | Descrição do tipo de pagamento
ativo               | `boolean`  | `default` | SIM         | SIM      | Variável para definir se pagamento está disponível ou não.

### Função
- Será responsável por definir quais os métodos de pagamentos estarão disponíveis.
    - 0 -`Boleto` — Método de pagamento via boleto.
    - 1 -`Cartão Crédito` — Método de pagamento via Cartão de Crédito.
    - 2 -`Cartão Débito` — Método de pagamento Débito.
    - 3 -`PicPay` — Método de pagamento utilizando PicPay.
    - 4 -`PayPal` — Método de pagamento utilizando PayPal.
    - 5 -`Pix` — Método de pagamento via chave Pix.

### Usuários
#### Dados
NOME           | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---           | ---        | ---       | ---         | ---      | --- 
id_usuario_pk  | `integer`  | `default` | SIM         | SIM      | Id do usuário.
nome           | `varchar`  | `256`     | SIM         | SIM      | Nome do usuário.
apelido        | `varchar`  | `256`     | NÃO         | SIM      | Apelido do usuário.
email          | `varchar`  | `256`     | SIM         | SIM      | Email do usuário.
cpf            | `long`     | `11`      | SIM         | SIM      | CPF do usuário.
data_criado    | `Date`     | `default` | SIM         | SIM      | Data que o usuário foi criado.
verificado     | `boolean`  | `default` | SIM         | SIM      | Variável para identificar email verificado.
data_verificado| `Date`     | `default` | SIM         | SIM      | Data que o usuário foi verificado.   
||
id_endereco_fk | `integer`  | `default` | SIM         | SIM      | [Id do Endereço](#endereço)
id_tipo_fk     | `integer`  | `default` | SIM         | SIM      | [Id do Tipo de usuário](#tipo-de-usuário)

#### Funções
- Poderão ser `criados` a partir de usuários não logados.

### Tipo de Usuário
#### Dados
NOME        | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
id_tipo_pk  | `integer`  | `default` | SIM         | SIM      | Id tipo de usuário.
nome        | `varchar`  | `13`      | SIM         | SIM      | Nome do tipo do usuário.

#### Funções
Tipos de `Usuário`:
  0. Administrador: Controle total sobre o sistema.
     - Poderá `criar` `alterar` `remover` `campanhas` ou `usuários`.
     - Controle dos grupos abaixo.
  

  1. Moderador:
     - Deverá `editar` ou `excluir` `campanhas` ou `comentários` que fujam das regras ou conforme necessidade.
     - Ficará a cargo de `verificar` cada `campanha` para ser publicamente `iniciada`.
     - Não pode fazer alterações dos `usuários`.
  
    
  2. Normal:
     - Poderão interagir através de `comentários` na `campanha`.
     - Podem `criar campanhas` para ajudar a `sí mesmo` ou `familiares próximos`.
     - Deverão ter cadastro `verificado` para fazer `doações`.  
     - Controle apenas do próprio `usuário` ou `campanha`.
       - Pode alterar o seu próprio `Usuário`.
       - `Não` podem apagar o seu próprio `usuário`.
       - Pode alterar a sua própria `Campanha`.
       - Pode alterar os seus próprios comentários em `Campanhas`.
  

  3. Desabilitado.
     - Deixará de poder fazer `login` e perderá todos os privilégios do tipo normal.
     - Será usado como forma de `deletar` o usuário.

### Comentários
#### Dados
NOME            | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---            | ---        | ---       | ---         | ---      | --- 
id_comentario_pk| `integer`  | `default` | SIM         | SIM      | Id do comentario.
descricao       | `varchar`  | `512`     | SIM         | SIM      | Conteudo do comentário.
dataCriado      | `Date`     | `default` | SIM         | SIM      | Data que foi feito o comentário.
ativo           | `boolean`  | `default` | SIM         | SIM      | Comentário está visível.
||
id_usuario_fk   | `integer`  | `default` | SIM         | SIM      | [Id responsável](#usuários).

### Endereço
#### Dados
NOME          | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---          | ---        | ---       | ---         | ---      | --- 
id_endereco_pk| `integer`  | `default` | SIM         | SIM      | Id do endereço.
rua           | `varchar`  | `64`      | SIM         | SIM      | Nome de sua rua/avenida
numero        | `integer`  | `6`       | SIM         | SIM      | Numero de sua residência.
cep           | `integer`  | `9`       | SIM         | SIM      | Numero do seu CEP
bairro        | `varchar`  | `128`     | NÃO         | SIM      | Nome de seu bairro
complemento   | `varchar`  | `128`     | NÃO         | SIM      | Complemento de seu endereço
||
id_cidade_fk  | `integer`  | `default` | SIM         | SIM      | [Id da cidade](#cidades)
id_estado_fk  | `integer`  | `default` | SIM         | SIM      | [Id do estado](#estados)


### Cidades
#### Dados
NOME        | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
id_cidade_pk| `integer`  | `default` | SIM         | SIM      | Id da cidade.
nome        | `varchar`  | `29`      | SIM         | SIM      | Nome da cidade.

### Estados
#### Dados
NOME        | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
id_estado_pk| `integer`  | `default` | SIM         | SIM      | Id do estado.
nome        | `varchar`  | `19`      | SIM         | SIM      | Nome do estado.


### Alteracao
#### Dados
NOME            | TIPO       | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---            | ---        | ---       | ---         | ---      | --- 
id_alteracao_pk | `integer`  | `default` | SIM         | SIM      | Id da alteração.
antes           | `json`     | `default` | SIM         | SIM      | Objeto `antes` da alteração
depois          | `json`     | `default` | SIM         | SIM      | Objeto `após` da alteração
data            | `Date`     | `default` | SIM         | SIM      | Data que a alteração ocorreu.
||
id_campanha_fk  | `integer`  | `default` | NÃO         | SIM      | [Id da campanha alterada](#campanha).
id_comentario_fk| `integer`  | `default` | NÃO         | SIM      | [Id do comentário alterado](#comentários).
id_usuario_fk   | `integer`  | `default` | SIM         | SIM      | [Id responsável](#usuários). 
