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

Cancelar cadastro 
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${usuariosElement}
  Click Element    locator=${usuariosElement}
  Wait Until Element Is Visible    locator=${novoCadastroButton}
  Click Button    locator=${novoCadastroButton}
  Click Button    locator=${cancelarButton}
Cancelar cadastro com dados
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
  Click Button    locator=${cancelarButton}

Listar Usuários
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${usuariosElement}
  Click Element    locator=${usuariosElement}


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
Listar Diretoria
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${diretoriaElement}
  Click Element    locator=${diretoriaElement}
  


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
Nome completo vazio
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${usuariosElement}
  Click Element    locator=${usuariosElement}
  Wait Until Element Is Visible    locator=${novoCadastroButton}
  Click Button    locator=${novoCadastroButton}
  Criar dados do usuário
  Wait Until Element Is Visible    locator=${nomeImput}
  Input Text    locator=${nomeImput}    text=
  Input Text    locator=${emailImput}    text=${EMAIL_RAMDOM}
  Input Text    locator=${perfilImput}    text=ADMIN
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  ${msgNomeCompleto}  Get Text  ${msgNomeVazio}
  Should Be Equal As Strings    ${msgNomeCompleto}    O campo nome completo é obrigatório

Campo nome com mais de 100 caracteres
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${usuariosElement}
  Click Element    locator=${usuariosElement}
  Wait Until Element Is Visible    locator=${novoCadastroButton}
  Click Button    locator=${novoCadastroButton}
  Criar dados do usuário
  Wait Until Element Is Visible    locator=${nomeImput}
  Input Text    locator=${nomeImput}    text=Iasdferuatarsfdvuyhufagstuikhsdfvcsryuhfiytrafsr Vasdferuatarsfdvugabufagstuikhsdfvcsryuhfiytrafsrvytgsh
  Input Text    locator=${emailImput}    text=${EMAIL_RAMDOM}
  Input Text    locator=${perfilImput}    text=ADMIN
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  Sleep   2s
  ${msgNomeCompleto}  Get Text  ${msgNomeInvalido}
  Should Be Equal As Strings    ${msgNomeCompleto}    O nome completo deve ter no máximo 100 caracteres.
  Sleep  3s
Campo nome completo com números
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${usuariosElement}
  Click Element    locator=${usuariosElement}
  Wait Until Element Is Visible    locator=${novoCadastroButton}
  Click Button    locator=${novoCadastroButton}
  Criar dados do usuário
  Wait Until Element Is Visible    locator=${nomeImput}
  Input Text                      locator=${nomeImput}    text=Marafa6 Gjahagfa678
  Input Text    locator=${emailImput}    text=${EMAIL_RAMDOM}
  Input Text    locator=${perfilImput}    text=ADMIN
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  sleep  2s
  ${msgNomeCompleto}  Get Text  ${msgNomeComNumeros}
  Should Be Equal As Strings    ${msgNomeCompleto}    O campo nome completo não deve conter números
  
  
Campo nome sem palavra composta 
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${usuariosElement}
  Click Element    locator=${usuariosElement}
  Wait Until Element Is Visible    locator=${novoCadastroButton}
  Click Button    locator=${novoCadastroButton}
  Criar dados do usuário
  Wait Until Element Is Visible    locator=${nomeImput}
  Input Text                      locator=${nomeImput}    text=Carlos
  Input Text    locator=${emailImput}    text=${EMAIL_RAMDOM}
  Input Text    locator=${perfilImput}    text=ADMIN
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  sleep  2s
  ${msgNomeCompleto}  Get Text  ${msgNomeSemSobrenome}
  Should Be Equal As Strings    ${msgNomeCompleto}    Informe o nome e sobrenome com as iniciais em letra maiúscula e sem caracteres especiais.
E-mail vazio
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
  Input Text    locator=${emailImput}    text=
  Input Text    locator=${perfilImput}    text=ADMIN
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  ${msgEmail}  Get Text  ${msgEmailVazio}
  Should Be Equal As Strings    ${msgEmail}    O campo email é obrigatório
  Sleep    4s

Campo e-mail no formato invalido
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
  Input Text    locator=${emailImput}    text=testes#qacoders.com.br
  Input Text    locator=${perfilImput}    text=ADMIN
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  ${msgEmail}  Get Text  ${msgEmailInvalido}
  Should Be Equal As Strings    ${msgEmail}    Email inválido
  Sleep    3s
Perfil de acesso vazio
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
  Input Text    locator=${perfilImput}    text=
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  sleep  2s
  ${msgPerfil}  Get Text  ${msgPerfilVazio}
  Should Be Equal As Strings    ${msgPerfil}    O campo perfil de acesso é obrigatório
Perfil de acesso invalido
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
  Input Text    locator=${perfilImput}    text=admnistração
  Input Text    locator=${cpfImput}    text=${CPF_RAMDOM}
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  Sleep  2s
  ${msgPerfil}  Get Text  ${msgPerfilInvalido}
  Should Be Equal As Strings    ${msgPerfil}    O campo perfil de acesso deve ser preenchido de acordo com o seu cargo exemplo: ADMIN.  
CPF vazio
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
  Input Text    locator=${cpfImput}    text=
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  ${msgcpf}  Get Text  ${msgCpfVazio}
  Should Be Equal As Strings    ${msgcpf}    O campo CPF é obrigatório
CPF inválido
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
  Input Text    locator=${cpfImput}    text=554273897453
  Input Text    locator=${senhaImput}    text=1234@Test
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  Sleep  2s
  ${msgcpf}  Get Text  ${msgCpfInvalido}
  Should Be Equal As Strings    ${msgcpf}    Deve preencher o CPF com 11 dígitos
  
Senha vazia
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
  Input Text    locator=${senhaImput}    text=
  Input Text    locator=${confirmarSenhaImput}    text=1234@Test
  Click Button    locator=${salvarNovoButton}
  Sleep  2s
  ${msgSenha}  Get Text  ${msgSenhaVazia}
  Should Be Equal As Strings    ${msgSenha}    O campo senha é obrigatório
  
  
Senha com formato inválido
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
  Input Text    locator=${senhaImput}    text=teste876
  Input Text    locator=${confirmarSenhaImput}    text=teste876
  Click Button    locator=${salvarNovoButton}
  Sleep  2s
  ${msgSenha}  Get Text  ${msgSenhaInvalida}
  Should Be Equal As Strings    ${msgSenha}    Senha precisa ter: uma letra maiúscula, uma letra minúscula, um número, um caractere especial(@#$%) e tamanho entre 8-12.
  
Confirmação de senha vazio
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
  Input Text    locator=${confirmarSenhaImput}    text=
  Click Button    locator=${salvarNovoButton}
  Sleep    2s
  ${msgConfirmarSenha}  Get Text  ${msgConfirmarSenhaVazia}
  Should Be Equal As Strings    ${msgConfirmarSenha}    O campo de confirmação de senha é obrigatório.
  
Campo confirmar senha com dados diferentes 
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
  Input Text    locator=${confirmarSenhaImput}    text=sjndhR@675
  Click Button    locator=${salvarNovoButton}
  Sleep    2s
  ${msgConfirmarSenha}  Get Text  ${msgConfirmarSenhaInvalida}
  Should Be Equal As Strings    ${msgConfirmarSenha}    As senhas não conferem.
  

    #Diretoria
Campo Diretoria vazio
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${diretoriaElement}
  Click Element    locator=${diretoriaElement}
  Wait Until Element Is Visible    locator=${novoCadastroDiretoriaButton}
  Click Button    locator=${novoCadastroDiretoriaButton}
  Wait Until Element Is Visible    locator=${nomeDiretoriaImput}
  Criar dados do usuário
  Input Text    locator=${nomeDiretoriaImput}    text=
  Click Button    locator=${salvarNovoDiretoriaButton}
  Sleep  2s
  ${msgDiretotia}  Get Text  ${msgDiretoriaVazia}
  Should Be Equal As Strings    ${msgDiretotia}   O campo diretoria é obrigatório

Diretoria com caractere inválido
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${diretoriaElement}
  Click Element    locator=${diretoriaElement}
  Wait Until Element Is Visible    locator=${novoCadastroDiretoriaButton}
  Click Button    locator=${novoCadastroDiretoriaButton}
  Wait Until Element Is Visible    locator=${nomeDiretoriaImput}
  Criar dados do usuário
  Input Text    locator=${nomeDiretoriaImput}    text=logístic@
  Click Button    locator=${salvarNovoDiretoriaButton}
  Sleep  2s
  ${msgDiretoria}  Get Text  ${msgDiretoriaInvalida} 
  Should Be Equal As Strings    ${msgDiretoria}    O campo 'diretoria' só pode conter letras e o caractere especial '&'.
  Sleep    4s

Campo Diretoria com mais de 50 caracteres
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${diretoriaElement}
  Click Element    locator=${diretoriaElement}
  Wait Until Element Is Visible    locator=${novoCadastroDiretoriaButton}
  Click Button    locator=${novoCadastroDiretoriaButton}
  Wait Until Element Is Visible    locator=${nomeDiretoriaImput}
  Criar dados do usuário
  Input Text    locator=${nomeDiretoriaImput}    text=logísticajayetardgetragsfdretvsgdeutrafcbdgferioagetsreinoutedasf
  Click Button    locator=${salvarNovoDiretoriaButton}
  Sleep  2s
  ${msgDiretoria}  Get Text  ${msgDiretoria50Caracteres}  
  Should Be Equal As Strings    ${msgDiretoria}     O campo diretoria pode ter no máximo 50 caracteres

Campo Diretoria já cadastrado anteriormente
  Sleep    1s
  Wait Until Element Is Visible    locator=${cadastrosElement}
  Click Element    locator=${cadastrosElement}
  Wait Until Element Is Visible    locator=${diretoriaElement}
  Click Element    locator=${diretoriaElement}
  Wait Until Element Is Visible    locator=${novoCadastroDiretoriaButton}
  Click Button    locator=${novoCadastroDiretoriaButton}
  Wait Until Element Is Visible    locator=${nomeDiretoriaImput}
  Criar dados do usuário
  Input Text    locator=${nomeDiretoriaImput}    text=logística
  Click Button    locator=${salvarNovoDiretoriaButton}
  Sleep  2s
  ${msgDiretoria}  Get Text  ${msgDiretoriaJaCadastrada}
  Should Be Equal As Strings    ${msgDiretoria}    Não é possível salvar esse registro. Diretoria já cadastrada no sistema.
