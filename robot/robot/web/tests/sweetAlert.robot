*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

*** Test Cases ***
Validate Success Button 
    Go to                               ${url}/sweet_alert
    Click Button                        ${botaoSucesso} 
    Wait Until Page Contains Element    ${iconeSucesso}              timeout=5
    Click Button                        ${okButton}

Validate Deu Ruim Button
    Go to                               ${url}/sweet_alert
    Click Button                        ${botaoDeuRuim}
    Wait Until Page Contains Element    ${iconeErro}                   timeout=5
    Click Button                        ${okButton}    

*** Variables *** 
${botaoSucesso}                         css=button[class='btn-success']
${iconeSucesso}                         css=div[class='swal-icon swal-icon--success']
${botaoDeuRuim}                         css=button[class='btn-danger']
${iconeErro}                            css=div[class='swal-icon--error__x-mark']
${okButton}                             css=button[class='swal-button swal-button--confirm']
