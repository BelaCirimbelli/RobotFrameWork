*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

***Variables***
${enableButton}                       //button[normalize-space()='Habilita']
${disableButton}                      //button[normalize-space()='Desabilita']
${movie}                              id:movie

*** Test Cases ***
Enable Dynamic Controls
  Go To                               ${url}/dynamic_controls
  Click enable button
  Wait Until Page Contains Element    id:message  timeout=5
  Should contain enable message       Campo habilitado!

Disable Dynamic Controls
  Go To                               ${url}/dynamic_controls
  Click enable button
  Wait Until Page Contains Element    id:message  timeout=5
  Click disable button
  Wait Until Page Contains Element    id:message  timeout=5
  Should contain enable message       Campo desabilitado!

Edit field
  Go To                               ${url}/dynamic_controls
  Click enable button
  Wait Until Page Contains Element    id:message  timeout=5
  Edit Movie name To                  Finding Nemo
  Click disable button
  Wait Until Page Contains Element    id:message  timeout=5
  Should contain enable message       Campo desabilitado!


*** Keywords ***
Click enable button
  Click Button              ${enableButton}

Click disable button
  Click Button              ${disableButton}

Edit Movie name To
  [Arguments]               ${text}
  Input text                ${movie}    ${text}  

Should contain enable message
  [Arguments]               ${expected_message}

  ${message}                 Get WebElement                    id:message
  Should Contain             ${message.text}                   ${expected_message}


