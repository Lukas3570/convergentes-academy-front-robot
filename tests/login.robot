*** Settings ***
Resource  ../resources/main.resource
Test Setup  Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***

  #  Testes funcionais:
Funcional - Login sysadmin
  Login sysadmin

Funcional - Login com usuário cadastrado
  [Tags]  login  cadastro  funcional
  Login sysadmin
  Cadastrar usuário
  Login com usuário cadastrado


  #  Testes não funcionais:
Não funcional - Login com email sem senha
  [Tags]  login   não funcional
  Login com email sem senha
Não funcional - Login com senha sem email
  [Tags]  login   não funcional
  Login com senha sem email