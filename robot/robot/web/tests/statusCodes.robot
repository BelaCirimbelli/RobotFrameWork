*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

***Variables***

*** Test Cases ***
Getting the Status Code 200
    Go To                                           ${url}/status_codes
    Should select and verify the status Code        200

*** Keywords ***
Should select and verify the status Code
    [Arguments]                         ${choosenStatusCode}
    Click Element                       css=a[href="status_codes/${choosenStatusCode}"]
    Page Should Contain                  Esta página retornou o código de status ${choosenStatusCode} status code.

                         