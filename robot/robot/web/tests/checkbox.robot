*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

*** Variables ***

${check_ironman}        css:input[value='iron-man']
${check_thor}           id:thor
${check_cap}            Xpath://input[@value='cap']
      

*** Test Cases ***
Marcar opção com ID             
    Go to                               ${url}checkboxes
    Select Checkbox                     ${check_thor}
    Checkbox Should Be Selected         ${check_thor}
 
Marcar opção com CSS selector
    Go to                               ${url}checkboxes
    Select Checkbox                     ${check_ironman}
    Checkbox Should Be Selected         ${check_ironman}

Marcando opção com Xpath selector
    Go to                               ${url}checkboxes
    Select Checkbox                     ${check_cap}
    Checkbox Should Be Selected         ${check_cap}
    

