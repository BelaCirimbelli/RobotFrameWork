*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

*** Test Cases ***
Clicking the Alert button
  Go To                           ${url}/javascript_alerts
  Clicking in the choosen button  Alerta
  Alert Should Be Present             
  Should contain message alert    Você ativou um alerta JS
  
Clicking the Confirm button
  Go To                           ${url}/javascript_alerts
  Clicking in the choosen button  Confirma
  Alert Should Be Present    
  Should contain message alert    Mensagem confirmada

Clicking the Confirm button
  Go To                           ${url}/javascript_alerts
  Clicking in the choosen button  Prompt
  Input Text Into Alert           Isabela    
  Should contain message alert    Olá, Isabela

*** Keywords ***
Clicking in the choosen button
  [Arguments]               ${choosenButton}

  Click Button    //button[normalize-space()='${choosenButton}']

Should contain message alert
  [Arguments]               ${expected_message}

  ${message}                 Get WebElement                    id:result
  Should Contain             ${message.text}                   ${expected_message}
