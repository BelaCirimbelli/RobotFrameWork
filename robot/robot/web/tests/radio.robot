*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

*** Test Cases ***
Selecionar por Id
    Go to                               ${url}/radios
    Select Radio Button                 movies      cap
    Radio Button Should Be Set To       movies      cap

Selecionando por value
   Go to                               ${url}/radios
    Select Radio Button                 movies      guardians
    Radio Button Should Be Set To       movies      guardians
