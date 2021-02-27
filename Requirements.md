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
||
idUsuarioPk | `int`      | `default` | SIM         | SIM      | [Id do Author](#Usuários)

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
verificado  | `boolean`  | `default` | SIM         | SIM      | Variável para identificar email verificado.   
||
idEnderecoFk| `int`      | `default` | SIM         | SIM      | [Id do Endereço](#Endereço)
idTipoFk    | `int`      | `default` | SIM         | SIM      | [Id do Tipo de usuário](#Tipos de Usuários)

####Funções
- Poderão ser `criados` a partir de usuários não logados.

###Tipos de Usuários
####Dados
NOME        | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
idTipoPk    | `int`      | `default` | SIM         | SIM      | Id tipo de usuário.
nome        | `string`   | `13`      | SIM         | SIM      | Nome do tipo do usuário.

####Funções
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

###Comentários
####Dados
NOME          | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---          | ---        | ---       | ---         | ---      | --- 
idComentarioPk| `int`      | `default` | SIM         | SIM      | Id do comentario.
descricao     | `string`   | `512`     | SIM         | SIM      | Conteudo do comentário.
dataCriado    | `Date`     | `default` | SIM         | SIM      | Data que foi feito o comentário.
ativo         | `boolean`  | `default` | SIM         | SIM      | Comentário está visível.
||
idUsuarioFk   | `int`      | `default` | SIM         | SIM      | [Id responsável](#Usuários).

###Endereço
####Dados
NOME        | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---        | ---        | ---       | ---         | ---      | --- 
idEnderecoPk| `int`      | `default` | SIM         | SIM      | Id do endereço.
rua         | `string`   | `64`      | SIM         | SIM      | Nome de sua rua/avenida
cep         | `number`   | `9`       | SIM         | SIM      | Numero do seu CEP
bairro      | `string`   | `128`     | NÃO         | SIM      | Nome de seu bairro
complemento | `string`   | `128`     | NÃO         | SIM      | Complemento de seu endereço
||
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
NOME          | VALOR      | TAMANHO   | OBRIGATÓRIO | COMPLETO | DESCRIÇÃO
 ---          | ---        | ---       | ---         | ---      | --- 
idAlteracaoPk | `int`      | `default` | SIM         | SIM      | Id da alteração.
antes         | `json`     | `default` | SIM         | SIM      | Objeto `antes` da alteração
depois        | `json`     | `default` | SIM         | SIM      | Objeto `após` da alteração
data          | `Date`     | `default` | SIM         | SIM      | Data que a alteração ocorreu.
||
idCampanhaFk  | `int`      | `default` | NÃO         | SIM      | [Id da campanha alterada](#Campanha).
idComentarioFk| `int`      | `default` | NÃO         | SIM      | [Id do comentário alterado](#Comentários).
idUsuarioFk   | `int`      | `default` | SIM         | SIM      | [Id responsável](#Usuários). 