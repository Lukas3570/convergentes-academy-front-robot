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

${cadastrosElement}                   //div[@class='MuiButtonBase-root MuiListItemButton-root MuiListItemButton-gutters MuiListItemButton-root MuiListItemButton-gutters css-1uwabd6'][contains(.,'Cadastros')]
${usuariosElement}                    //span[@class='MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-yb0lig'][contains(.,'Usuários')]
${perfilImput}                        //input[contains(@name,'accessProfile')]
${diretoriaElement}                   //span[@class='MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-yb0lig'][contains(.,'Diretorias')]

# Alerts Errors:
${msgEmailObrigatorio}                //p[@class='css-18xtib3'][contains(.,'O email é obrigatório')]
${msgSenhaObrigatorio}                //p[@class='css-18xtib3'][contains(.,'A senha é obrigatória')]