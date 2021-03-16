*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

*** Test Cases ***
Login com sucesso  
  Go To                      ${url}/login
  Login with                 stark  jarvis!
 
  Should see logged user     Tony Stark  


Senha Invalida
  [Tags]                     login_error
  Go To                      ${url}/login
  Login with                 stark              bundadenenem
  
  Should contain message alert login      Senha é invalida
   
Usuario não existe
  [Tags]                     login_error
  Go To                      ${url}/login
  Login with                 mahuan              jarvis!
  
  Should contain message alert login  O usuário informado não está cadastrado!

*** Keywords ***
Login with  
  [Arguments]    ${uname}     ${password}
    
   Input Text      css:input[name=username]         ${uname} 
   Input Text      css:input[name=password]         ${password}
   Click Button         class:btn-login

Should contain message alert login
  [Arguments]               ${expected_message}

  ${message}                 Get WebElement                    id:flash
  Should Contain             ${message.text}                   ${expected_message}

Should see logged user
   [Arguments]           ${fullname}
 
   Page Should Contain    Olá, ${fullname}. Você acessou a área logada!

 
