*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${NAME_FIELD} =  xpath=/html/body/div[1]/div/form/label[1]/input
${EMAIL_FIELD} =  xpath=/html/body/div[1]/div/form/label[2]/input
${PHONE_FIELD} =  xpath=/html/body/div[1]/div/form/label[3]/input
${ABOUT_FIELD} =  xpath=/html/body/div[1]/div/form/label[4]/textarea

*** Keywords ***
Open Form
    go to  ${URL}
    wait until page contains  Представьтесь, пожалуйста

Fill Data
    [Arguments]  ${Name}  ${Email}  ${Phone}  ${About}
    Fill Name Field     ${Name}
    Fill Email Field    ${Email}
    Fill Phone Field    ${Phone}
    Fill About Project Field    ${About}

Correct Submit
    Click Button    Оставить заявку
    Wait Until Page Contains    Сообщение успешно отправлено!
    
Submit Empty
    Click Button    Оставить заявку
    Page should contain    ${EMPTY_FIELD_ERROR_MESSAGE}

Fill Name Field
    [Arguments]     ${Name}
    Input Text    ${NAME_FIELD}   ${Name}

Fill Email Field
    [Arguments]     ${Email}
    Input Text    ${EMAIL_FIELD}   ${Email}

Fill Phone Field
    [Arguments]     ${Phone}
    Input Text    ${PHONE_FIELD}   ${Phone}

Fill About Project Field
    [Arguments]     ${About}
    Input Text    ${ABOUT_FIELD}    ${About}