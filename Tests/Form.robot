*** Settings ***
Documentation   Tests for form on http://test-form.sibirix.ru/
Resource    ../Resources/common.robot
Resource    ../Resources/FormApp.robot
Test Setup  Begin Web Test
Test Teardown   End Web Test

# robot -d results tests/Form.robot

*** Variables ***
${BROWSER} =  headlesschrome
${URL} =  http://test-form.sibirix.ru/
${EMPTY_FIELD_ERROR_MESSAGE} =  Запонлите поле
${Correct_name} =  Вася
${Correct_email} =  karl@gmail.com
${Correct_phone} =  89997897898
${Correct_about} =  Хороший проект

*** Test Cases ***
Submit with correct data
    FormApp.Open Form
    FormApp.Fill Data   ${Correct_name}  ${Correct_email}  ${Correct_phone}  ${Correct_about}
    FormApp.Correct Submit

Submit with empty name
    FormApp.Open Form
    FormApp.Fill Data   ${EMPTY}  ${Correct_email}  ${Correct_phone}  ${Correct_about}
    FormApp.Submit Empty

Submit with empty email
    FormApp.Open Form
    FormApp.Fill Data   ${Correct_name}  ${EMPTY}  ${Correct_phone}  ${Correct_about}
    FormApp.Submit Empty

Submit with empty phone
    FormApp.Open Form
    FormApp.Fill Data   ${Correct_name}  ${Correct_email}  ${EMPTY}  ${Correct_about}
    FormApp.Submit Empty

Submit with empty about
    FormApp.Open Form
    FormApp.Fill Data   ${Correct_name}  ${Correct_email}  ${Correct_phone}  ${EMPTY}
    FormApp.Submit Empty

Submit with space in name
    FormApp.Open Form
    FormApp.Fill Data   ${SPACE}  ${Correct_email}  ${Correct_phone}  ${Correct_about}
    FormApp.Submit Empty

Submit with space in email
    FormApp.Open Form
    FormApp.Fill Data   ${Correct_name}  ${SPACE}  ${Correct_phone}  ${Correct_about}
    FormApp.Submit Empty

Submit with space in phone
    FormApp.Open Form
    FormApp.Fill Data   ${Correct_name}  ${Correct_email}  ${SPACE}  ${Correct_about}
    FormApp.Submit Empty

Submit with space in about
    FormApp.Open Form
    FormApp.Fill Data   ${Correct_name}  ${Correct_email}  ${Correct_phone}  ${SPACE}
    FormApp.Submit Empty