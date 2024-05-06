*** Settings ***
Documentation   Arquivo de localização das variáveis de ambiente

*** Variables ***

# URLs:
${URL}                         https://automacao.qacoders-academy.com.br/login

# Browser Options 
${chrome}                  chrome
${firefox}                 firefox

# Inputs:
${emailAdminImput}                  //input[contains(@id,'email')]
${senhaAdminImput}                  //input[contains(@id,'password')]
${nomeImput}                          //input[contains(@name,'fullName')]
${emailImput}                         //input[@name='mail']
${cpfImput}                           //input[contains(@name,'cpf')]
${senhaImput}                         //input[contains(@name,'password')]
${confirmarSenhaImput}                //input[contains(@name,'confirmPassword')]
${nomeDiretoriaImput}                 //input[contains(@class,'MuiInputBase-input MuiInput-input css-mnn31')]

# Button and Elements:
${entrarButton}                //button[contains(@id,'login')]
${salvarNovoButton}                   //button[@type='submit'][contains(.,'SALVAR NOVO')]
${novoCadastroDiretoriaButton}        //button[@class='css-fvzsut'][contains(.,'Novo Cadastro')]
${salvarNovoDiretoriaButton}          //button[@type='submit'][contains(.,'SALVAR NOVO')]
${logoutButton}                       //button[@class='css-1nvbq2d'][contains(.,'Logout')]
${novoCadastroButton}                 //button[@class='css-fvzsut'][contains(.,'Novo Cadastro')]
${cancelarButton}                     //button[@type='button'][contains(.,'CANCELAR')]

${cadastrosElement}                   //div[@class='MuiButtonBase-root MuiListItemButton-root MuiListItemButton-gutters MuiListItemButton-root MuiListItemButton-gutters css-1uwabd6'][contains(.,'Cadastros')]
${usuariosElement}                    //span[@class='MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-yb0lig'][contains(.,'Usuários')]
${perfilImput}                        //input[contains(@name,'accessProfile')]
${diretoriaElement}                   //span[@class='MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-yb0lig'][contains(.,'Diretorias')]

# Alerts Errors:
${msgEmailObrigatorio}                //p[@class='css-18xtib3'][contains(.,'O email é obrigatório')]
${msgSenhaObrigatorio}                //p[@class='css-18xtib3'][contains(.,'A senha é obrigatória')]
${msgNomeVazio}                       //p[@class='css-bbipig'][contains(.,'O campo nome completo é obrigatório')]
${msgNomeInvalido}                    //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'O nome completo deve ter no máximo 100 caracteres.')]
${msgNomeComNumeros}                  //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'O campo nome completo não deve conter números')]
${msgNomeSemSobrenome}                //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'Informe o nome e sobrenome com as iniciais em letra maiúscula e sem caracteres especiais.')]
${msgEmailVazio}                      //p[@class='css-bbipig'][contains(.,'O campo email é obrigatório')]
${msgEmailInvalido}                  //p[@class='css-bbipig'][contains(.,'Email inválido')]
${msgPerfilVazio}                     //p[@class='css-bbipig'][contains(.,'O campo perfil de acesso é obrigatório')]
${msgPerfilInvalido}                  //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'O campo perfil de acesso deve ser preenchido de acordo com o seu cargo exemplo: ADMIN.')]
${msgCpfVazio}                        //p[@class='css-bbipig'][contains(.,'O campo CPF é obrigatório')]
${msgCpfInvalido}                     //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'Deve preencher o CPF com 11 dígitos')]
${msgSenhaVazia}                      //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'O campo senha é obrigatório')]
${msgSenhaInvalida}                   //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'Senha precisa ter: uma letra maiúscula, uma letra minúscula, um número, um caractere especial(@#$%) e tamanho entre 8-12.')]
${msgConfirmarSenhaVazia}             //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'O campo de confirmação de senha é obrigatório.')]
${msgConfirmarSenhaInvalida}          //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'As senhas não conferem.')]
${msgDiretoriaVazia}                  //p[@class='css-bbipig'][contains(.,'O campo diretoria é obrigatório')]                 
${msgDiretoriaInvalida}               //div[contains(@class,'MuiAlert-message css-1xsto0d')]
${msgDiretoria50Caracteres}           //p[@class='css-bbipig'][contains(.,'O campo diretoria pode ter no máximo 50 caracteres')]
${msgDiretoriaJaCadastrada}           //div[@class='MuiAlert-message css-1xsto0d'][contains(.,'Não é possível salvar esse registro. Diretoria já cadastrada no sistema.')]