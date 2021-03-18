*** Settings ***
Resource        base.robot
Test Setup      Nova Sessao
Test Teardown   Encerra Sessao

***Variables***

*** Test Cases ***
Opening a new Tab
    Go To                               ${url}/windows
    Page Should Contain                 Abrindo uma nova Janela                 
    Click Element                       css=a[href="/windows/new"]
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]
    Page Should Contain Element                 xpath=//h3

    
    



                    

        



                         