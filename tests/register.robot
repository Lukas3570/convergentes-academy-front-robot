*** Settings ***
Resource  ../resources/main.resource
Test Setup  Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***

  #  Testes funcionais:
Funcional - Cadastro de usuário
  [Tags]  cadastro  funcional
  Login sysadmin
  Cadastrar usuário
Funcional - Cadastro de diretoria
  [Tags]  cadastro  funcional
  Login sysadmin
  Cadastrar Diretoria