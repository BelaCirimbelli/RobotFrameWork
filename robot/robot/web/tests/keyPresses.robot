*** Settings ***
Resource        base.robot

Test Setup      Nova Sessao
Test Teardown   Encerra Sessao

***Variables***

*** Test Cases ***
Checking the pressed Key
    Go To                               ${url}/key_presses
    Inserting and Checking a Key        A                 

*** Keywords ***
Inserting and Checking a Key
    [Arguments]                         ${pressedKey}
    Input Text                          id:campo-id     ${pressedKey}
    Page Should Contain                 You entered: ${pressedKey}
        



                         