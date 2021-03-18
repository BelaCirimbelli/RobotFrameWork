*** Settings ***
Resource    base.robot

Test Setup  Nova Sessao
Test Teardown   Encerra Sessao

*** Test Cases ***
Complete a request At Burger House 
    Go To Restaurant Page          Burger House                                           
    Add requests                   ${opção1}
    Click Element                  ${FecharPedido}
    Preencher Dados de Pagamento   Jao Sem Cao  caodahora@everis.com  Rua do Boreu  171  caverna  Dinheiro

Complete A Request At Green Food

    Go To Restaurant Page          Green Food
    Add requests                   ${opção1}
    Click Element                  ${FecharPedido}
    Preencher Dados de Pagamento   Lil Wayne  waynizin@everflex.com  casas alugadas  420  predio   Cartão Refeição  

Complete A Request At Tasty Treats
    [Tags]                         smoke
    Go To Restaurant Page          Tasty Treats
    Add requests                   ${opção1}
    Click Element                  ${FecharPedido}
    Preencher Dados de Pagamento   Lil Wayne  waynizin@everflex.com  casas alugadas  420  predio   Cartão Refeição

Complete A Request At Coffee Corner
    [Tags]                         smoke
    Go To Restaurant Page          Coffee Corner
    Add requests                   ${opção1}
    Click Element                  ${FecharPedido}
    Preencher Dados de Pagamento   Lil Wayne  waynizin@everflex.com  casas alugadas  420  predio   Cartão Refeição 

Complete A Request At Ice Cream
    [Tags]                         smoke
    Go To Restaurant Page          Ice Cream
    Add requests                   ${opção1}
    Click Element                  ${FecharPedido}
    Preencher Dados de Pagamento   Lil Wayne  waynizin@everflex.com  casas alugadas  420  predio   Cartão Refeição

Complete A Request At Bread & Bakery
    [Tags]                         smoke
    Go To Restaurant Page          Bread & Bakery
    Add requests                   ${opção1}
    Click Element                  ${FecharPedido}
    Preencher Dados de Pagamento   Lil Wayne  waynizin@everflex.com  casas alugadas  420  predio   Cartão Refeição


*** Variables ***
${urlEnjoeat}                       https://enjoeat.herokuapp.com/restaurants
${FecharPedido}                     xpath=//a[normalize-space()='Fechar Pedido']
${opção1}                           xpath=//mt-menu-item[1]//div[1]//div[1]//a[1]                            


*** Keywords ***
Go To Restaurant Page
    [Arguments]                             ${selectRestaurant} 
   
    Go to                                   ${urlEnjoeat}
    Wait Until Page Contains Element        xpath=//span[normalize-space()='${selectRestaurant}']
    Click Element                           xpath=//span[normalize-space()='${selectRestaurant}']


Add requests              
    [Arguments]                             ${addToCartElement}

    Wait Until Page Contains Element        ${addToCartElement}        timeout=10
    Click Element                           ${addToCartElement}                     

Preencher Dados de Pagamento 
    [Arguments]             ${nome}         ${email}      ${endereco}       ${numero}       ${complemento}      ${formaPagamento}  #Dinheiro, Cartão de Débito, Cartão Refeição
  
    Input Text                         xpath=//input[@placeholder='Nome']                      ${nome}
    Input Text                         xpath=//input[@placeholder='E-mail']                    ${email}
    Input Text                         xpath=//input[@placeholder='Confirmação do e-mail']     ${email}
    Input Text                         xpath=//input[@placeholder='Endereço']                  ${endereco}
    Input Text                         xpath=//input[@placeholder='Número']                    ${numero}
    Input Text                         xpath=//input[@placeholder='Complemento']               ${complemento}
    
    Click Element                      xpath=//label[normalize-space()='${formaPagamento}']//ins
    Click Element                      xpath=//button[normalize-space()='Concluir Pedido']
    Wait Until Page Contains Element   css=div[class='jumbotron']
    Page Should Contain Element        css=div[class='jumbotron']


   