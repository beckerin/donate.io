#Lista de requerimentos


###Campanha

####Dados
 NOME       | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO 
 ---        | ---        | ---       | ---         | ---      | --- 
idCampanhaPk| `int`      | `default` | SIM         | SIM      | Id principal da campanha.  
titulo      | `string`   | `256`     | SIM         | SIM      | Titulo da campanha.
descricao   | `string`   | `1024`    | SIM         | SIM      | Descição da campanha em detalhes.
dataCriado  | `Date`     | `default` | SIM         | SIM      | Data que a campanha foi criada.
dataPrazo   | `Date`     | `default` | SIM         | SIM      | Data de conclusão da campanha.
|||||
idUsuarioPk | `int`      | `default` | SIM         | NÃO      | [Id do Author](#Usuários)

TODO: `DIO-006 `[#6](https://github.com/beckerin/donate.io/issues/6)

####Funções
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


###Usuários

####Dados
NOME        | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
idUsuarioPk | `int`      | `default` | SIM         | SIM      | Id do usuário.
nome        | `string`   | `256`     | SIM         | SIM      | Nome do usuário.
apelido     | `string`   | `256`     | NÃO         | SIM      | Apelido do usuário.
email       | `string`   | `256`     | SIM         | SIM      | Email do usuário.
cpf         | `long`     | `11`      | SIM         | SIM      | CPF do usuário.
dataCriado  | `Date`     | `default` | SIM         | SIM      | Data que o usuário foi criado.
|||||
idEnderecoFk| `int`      | `default` | SIM         | NÃO      | [Id do Endereço](#Endereço)
idTipoFk    | `int`      | `default` | SIM         | NÃO      | [Id do Tipo de usuário](#Tipos de Usuários)

- TODO: `DIO-006 `[#6](https://github.com/beckerin/donate.io/issues/6)


####Funções
- Poderão ser `criados` a partir de usuários não logados.
- Podem alterar o seu próprio cadastro.
- `Usuários` não podem apagar o seu próprio `usuário`, apenas a sua utilização será bloqueada.
- Deverão ter cadastro `verificado` para fazer `doações`.
- Podem `criar campanhas` para ajudar a `sí mesmo` ou `familiares próximos`.
- Poderão interagir através de `comentários` na `campanha`.



###Administrador
 - Será um dos `tipos de usuário`.

####Funções
- Poderá `criar` `alterar` `remover` `campanhas` ou `usuários`.
- Ficará a cargo de `verificar` cada `campanha` para ser publicamente `iniciada`.
- Deverá `editar` ou `excluir` `campanhas` ou `comentários` que fujam das regras ou conforme necessidade.

###Tipos de Usuários
####Dados
NOME        | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
idTipoPk    | `int`      | `default` | SIM         | SIM      | Id tipo de usuário.
nome        | `string`   | `13`      | SIM         | SIM      | Nome do tipo do usuário.

####Funções
Tipos de `Usuário`:
  0. Administrador: Controle total sobre o sistema.
  1. Moderador: Controle dos grupos abaixo.
  2. Normal: Controle apenas do próprio `usuário` ou `campanha`.
  3. Desabilitado.

###Endereço
####Dados
NOME        | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
idEnderecoPk| `int`      | `default` | SIM         | SIM      | Id do endereço.
rua         | `string`   | `64`      | SIM         | SIM      | Nome de sua rua/avenida
cep         | `number`   | `9`       | SIM         | SIM      | Numero do seu CEP
bairro      | `string`   | `128`     | NÃO         | SIM      | Nome de seu bairro
complemento | `string`   | `128`     | NÃO         | SIM      | Complemento de seu endereço
||||||
idCidadeFk  | `int`      | `default` | SIM         | SIM      | [Id da cidade](#Cidades)
idEstadoFk  | `int`      | `default` | SIM         | SIM      | [Id do estado](#Estados)


###Cidades
####Dados
NOME        | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
idCidadePk  | `int`      | `default` | SIM         | SIM      | Id da cidade.
nome        | `string`   | `29`      | SIM         | SIM      | Nome da cidade.

###Estados
####Dados
NOME        | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
idEstadoPk  | `int`      | `default` | SIM         | SIM      | Id do estado.
nome        | `string`   | `19`      | SIM         | SIM      | Nome do estado.


###Alterações
####Dados
NOME         | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---         | ---        | ---       | ---         | ---      | --- 
idAlteracaoPk| `int`      | `default` | SIM         | SIM      | Id da alteração.
antes        | `json`     | `default` | SIM         | SIM      | Campanha `antes` da alteração
depois       | `json`     | `default` | SIM         | SIM      | Campanha `após` da alteração
data         | `Date`     | `default` | SIM         | SIM      | Data que a alteração ocorreu.
||||||
idCampanhaFk | `int`      | `default` | SIM         | SIM      | [Id da campanha alterada](#Campanha).
idUsuarioFk  | `int`      | `default` | SIM         | SIM      | [Id responsável pela](#Usuários). 