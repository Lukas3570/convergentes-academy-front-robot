*** Settings ***
Library  SeleniumLibrary
Library  String

Resource  variables.resource 

*** Keywords ***
Abrir o navegador
  Open Browser  browser=chrome
  Maximize Browser Window
  Go To    url=${URL}

Fechar o navegador
  Close Browser

#  Criação de dados
Criar dados do usuário
  ${palavra_randomica}  Generate Random String  length=8  chars=[LETTERS]
  ${palavra_randomica}  Convert To Lower Case   ${palavra_randomica}
  ${cpf_randomico}  Generate Random String  length=11  chars=[NUMBERS]
  Set Test Variable     ${NOME_RAMDOM}           T${palavra_randomica} L${palavra_randomica}
  Set Test Variable    ${CPF_RAMDOM}         ${cpf_randomico}
  Set Test Variable     ${EMAIL_RAMDOM}           ${palavra_randomica}@qacoders.com.br
  Log                   ${EMAIL_RAMDOM}


#  Testes funcionais

#  Login
Login sysadmin
  Wait Until Element Is Visible    locator=${emailAdminImput}
  Input Text    locator=${emailAdminImput}    text=sysadmin@qacoders.com
  Input Text    locator=${senhaAdminImput}    text=1234@Test
  Click Element    locator=${entrarButton}
  Sleep    1s
Login com usuário cadastrado
  Click Button    locator=${logoutButton}
  Wait Until Element Is Visible    locator=${emailAdminImput}
  Input Text    locator=${emailAdminImput}    text=${EMAIL_RAMDOM}
  Input Text    locator=${senhaAdminImput}    text=1234@Test
  Click Element    locator=${entrarButton}
  Sleep    1s


#  Cadastro
Cadastrar usuário
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${usuariosElement}
  Click Element    locator=${usuariosElement}
  Wait Until Element Is Visible    locator=${novoCadastroButton}
  Click Button    locator=${novoCadastroButton}
  Criar dados do usuário
  Wait Until Element Is Visible    locator=${nomeImput}
  Input Text    locator=${nomeImput}    text=${NOME_RAMDOM}
  Input Text    locator=${emailImput}    text=${EMAIL_RAMDOM}
  Input Text    locator=${perfilImput}    text=ADMIN
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
Cadastrar Diretoria
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${diretoriaElement}
  Click Element    locator=${diretoriaElement}
  Wait Until Element Is Visible    locator=${novoCadastroDiretoriaButton}
  Click Button    locator=${novoCadastroDiretoriaButton}
  Wait Until Element Is Visible    locator=${nomeDiretoriaImput}
  Criar dados do usuário
  Input Text    locator=${nomeDiretoriaImput}    text=${NOME_RAMDOM}
  Click Button    locator=${salvarNovoDiretoriaButton}


#  Testes não funcionais:

#  Login
Login com email sem senha
  Wait Until Element Is Visible    locator=${emailAdminImput}
  Input Text    locator=${emailAdminImput}    text=sysadmin@qacoders.com
  Click Element    locator=${entrarButton}
  ${msgSenha}  Get Text  ${msgSenhaObrigatorio}
  Should Be Equal As Strings    ${msgSenha}    A senha é obrigatória

Login com senha sem email
  Wait Until Element Is Visible    locator=${senhaAdminImput}
  Input Text    locator=${senhaAdminImput}    text=1234@Test
  Click Element    locator=${entrarButton}
  ${msgEmail}  Get Text  ${msgEmailObrigatorio}
  Should Be Equal As Strings    ${msgEmail}    O email é obrigatório


#  Cadastro
