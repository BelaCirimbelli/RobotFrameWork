*** Settings ***
Resource        base.robot
Library         RPA.Browser.Selenium
Test Setup      Nova Sessao
Test Teardown   Encerra Sessao

***Variables***

*** Test Cases ***
Opening a new Tab
    Go To                               ${url}/windows
    Page Should Contain                 Abrindo uma nova Janela                 
    Click Element                       css=a[href="/windows/new"]
    Sleep       5
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]
    Page Should Contain Element                 xpath=//h3

    
    



                    

        



                         