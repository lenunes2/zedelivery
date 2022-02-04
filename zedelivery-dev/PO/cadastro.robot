*** Settings ***
Library        SeleniumLibrary
Library        String
Library        OperatingSystem

*** Variables ***     
${btnEntrar}                //*[@id="welcome-button-sign-in"]
${btnCriarConta}            //*[@id="create-account-link"]
${nome}                     //*[@id="signup-form-input-name"]
${email}                    //*[@id="signup-form-input-email"]
${senha}                    //*[@id="signup-form-input-password"]
${cpf}                      //*[@id="signup-form-input-document"]
${cel}                      //*[@id="signup-form-input-phone"]
${dtNasc}                   //*[@id="signup-form-input-age"]
${termosCondicoes}          //*[@id="sign-up-form-input-terms"]
${btnCriarContaForms}       //*[@id="signup-form-button-signup"]
${cookies}                  //*[@id="onetrust-accept-btn-handler"]
*** KeyWords ***    

Dado que estou na pagina de Cadastro
    Click Element                        ${btnEntrar}  
    Wait Until Element Is Visible        ${btnCriarConta} 
    Wait Until Element Is Visible        ${cookies}
    Click Element                        ${cookies}
    Sleep  1s
    Run Keyword And Ignore Error    Scroll Element Into View     ${btnCriarConta}
    Click Element                        ${btnCriarConta} 
Quando eu preencho todos os campos
    ${file}          Get File            ${EXECDIR}/Data/cadastro.json
    ${json_object}   Evaluate           json.loads($file)           json
    FOR   ${cadastro}   IN  ${json_object['Cadastro']}
          Input Text      ${nome}        ${cadastro['nome']}
          Input Text      ${email}       ${cadastro['email']}
          Input Text      ${senha}       ${cadastro['senha']}
          Input Text      ${cpf}         ${cadastro['cpf']}
          Input Text      ${cel}         ${cadastro['cel']}
          Input Text      ${dtNasc}      ${cadastro['dtNasc']}
    END
    
E seleciono o checkbox
    Run Keyword And Ignore Error    Scroll Element Into View     ${termosCondicoes}
    Select Checkbox                      ${termosCondicoes}   

E clico no botão para criar conta
    Run Keyword And Ignore Error    Scroll Element Into View     ${btnCriarContaForms}
    Click Element                     ${btnCriarContaForms}
    Sleep  10s


