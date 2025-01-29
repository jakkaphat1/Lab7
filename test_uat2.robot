*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    E:/Software Engineering/LAB7/ChromeDriverANDChromeTesting/chrome.exe
${CHROME_DRIVER_PATH}     E:/Software Engineering/LAB7/ChromeDriverANDChromeTesting/chromedriver.exe
${SERVER}                 localhost:7272
${BROWSER}                Chrome
${DELAY}                  0.05
${BASE_URL}               http://localhost:7272/Form.html
${VALID USER}             demo
${VALID PASSWORD}         mode
${FIRST_NAME}             Somsong
${LAST_NAME}              Sandee
${DESTINATION}            Europe
${CONTACT_PERSON}         Sodsai Sandee
${RELATIONSHIP}           Mother
${EMAIL}                  somsong@kkumail.com
${PHONE_NO}               081-111-1234

*** Test Cases ***
TC_001 : Empty Destination
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${Empty}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain     Please enter destination
    Close Browser

TC_002 : Empty Email
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${Empty}
    Input Text    id=phone         ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain     Please enter a valid email address
    Close Browser

TC_003 : Invalid Email
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         somsong@
    Input Text    id=phone         ${PHONE_NO}
    Click Button    id=submitButton
    Page Should Contain     Please enter a valid email address.
    Close Browser

TC_004 : Empty Phone Number
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         ${Empty}
    Click Button    id=submitButton
    Page Should Contain     Please enter a phone number.
    Close Browser

TC_005 : Invalid Phone Number
    Open Browser    ${BASE_URL}    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Selenium Speed    ${DELAY}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname     ${LAST_NAME}
    Input Text    id=destination   ${DESTINATION}
    Input Text    id=contactperson    ${CONTACT_PERSON}
    Input Text    id=relationship  ${RELATIONSHIP}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         191
    Click Button    id=submitButton
    Page Should Contain     Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678
    Close Browser