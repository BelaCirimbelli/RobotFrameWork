*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

*** Test Cases ***
Complete a request 
    Go To The Main Page  
        



*** Keywords ***
Go To The Main Page 
    Go to                                   ${url}/nice_iframe
    Wait Until Element Is Visible           css=a[class='navbar-brand']         timeout=5
    Click Element                           css=a[class='navbar-brand']