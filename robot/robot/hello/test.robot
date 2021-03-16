
*** Settings ***
Library    app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=      Welcome        Luis
    Should Be Equal     ${result}   Olá Luis, bem vindo ao curso basico de RobotFramework!