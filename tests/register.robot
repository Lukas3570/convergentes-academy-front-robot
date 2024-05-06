*** Settings ***
Resource  ../resources/main.resource
Test Setup  Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***

  #  Testes funcionais: USUÁRIOS
Funcional - Cadastro de usuário
  [Tags]  cadastro  funcional
  Login sysadmin
  Cadastrar usuário
Funcional - Cancelar cadastro 
  [Tags]  cadastro  funcional
  Login sysadmin
  Cancelar cadastro
Funcional - Cancelar cadastro com dados preenchidos
  [Tags]  cadastro  funcional
  Login sysadmin
  Cancelar cadastro com dados
Funcional - Listar usuários
  [Tags]  cadastro  funcional
  Login sysadmin
  Listar Usuários

  #  Testes funcionais: DIRETORIA
Funcional - Cadastro de diretoria
  [Tags]  diretoria  funcional
  Login sysadmin
  Cadastrar Diretoria
Funcional - Listar diretoria
  [Tags]  diretoria funcional
  Login sysadmin
  Listar Diretoria

   
   #  Testes não funcionais: Cadastro
Não funcional - Nome completo Vazio
  [Tags]  cadastro não funcional
  Login sysadmin
  Nome completo vazio
Não funcional - Campo nome com mais de 100 caracteres
  [Tags]  cadastro não funcional
  Login sysadmin
  Campo nome com mais de 100 caracteres
Não funcional - Campo nome com números
  [Tags]  cadastro não funcional
  Login sysadmin
  Campo nome completo com números
Não funcional - Campo nome completo sem sobrenome
  [Tags]  cadastro não funcional
  Login sysadmin
  Campo nome sem palavra composta
Não funcional - E-mail vazio
  [Tags]  cadastro não funcional
  Login sysadmin
  E-mail vazio
Não funcional - E-mail inválido
  [Tags]  cadastro não funcional
  Login sysadmin
  Campo e-mail no formato invalido
Não funcional - Perfil de acesso vazio
  [Tags]  cadastro não funcional
  Login sysadmin
  Perfil de acesso vazio
Não funcional - Perfil de acesso inválido
  [Tags]  cadastro não funcional
  Login sysadmin
  Perfil de acesso invalido
Não funcional - CPF vazio
  [Tags]  cadastro não funcional
  Login sysadmin
  CPF vazio
Não funcional - CPF inválido
  [Tags]  cadastro não funcional
  Login sysadmin
  CPF inválido
Não funcional - Senha vazia
  [Tags]  cadastro não funcional
  Login sysadmin
  Senha vazia
Não funcional - Senha inválida
  [Tags]  cadastro não funcional
  Login sysadmin
  Senha com formato inválido
Não funcional - Confirmação de senha vazia
  [Tags]  cadastro não funcional
  Login sysadmin
  Confirmação de senha vazio
Não funcional - Confirmação de senha com dado diferente
  [Tags]  cadastro não funcional
  Login sysadmin
  Campo confirmar senha com dados diferentes

  # Testes não funcionais: DIRETORIA

Não funcional - Campo diretoria vazio
  [Tags]  diretoria não funcional
  Login sysadmin
  Campo Diretoria vazio
Não funcional - Campo diretoria com caractere inválido
  [Tags]  diretoria não funcional
  Login sysadmin
  Diretoria com caractere inválido
Não funcional - Campo diretoria com mais de 50 caracteres
  [Tags]  diretoria não funcional
  Login sysadmin
  Campo Diretoria com mais de 50 caracteres
Não funcional - Campo diretoria já cadastrado anteriormente
  [Tags]  diretoria não funcional
  Login sysadmin
  Campo Diretoria já cadastrado anteriormente