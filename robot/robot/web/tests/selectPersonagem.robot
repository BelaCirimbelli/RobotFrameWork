*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

**** Variables ***

***Test Cases***
Selecioanr por texto e validar pelo valor 
    Go To                               ${url}/dropdown
    Select From List By Label           class:avenger-list              Scott Lang
    ${selectedValue}=                   Get Selected List Value         class:avenger-list
    Should Be Equal                     ${selectedValue}                7        

Selecionar por valor e validar pelo texto
    Go To                                ${url}/dropdown
    Select From List By Value            id:dropdown                    3
    ${selectedLabel}=                    Get Selected List Label        id:dropdown
    Should Be Equal                      ${selectedLabel}               Tony Stark
