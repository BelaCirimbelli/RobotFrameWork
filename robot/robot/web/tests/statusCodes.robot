*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

***Variables***
                           

*** Test Cases ***
Getting the Status Code 200
    Go To                               ${url}/status_codes
    Should select the status Code       200
    Should see Status Code Page         

*** Keywords ***
Should select the status Code
    [Arguments]                         ${choosenStatusCode}
    Click Element                       css=a[href="status_codes/${choosenStatusCode}"]

#Should see Status Code Page
   #Page Should Contain                  Esta página retornou o código de status ${choosenStatusCode} status code.
                         