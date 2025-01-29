*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    E:/Software Engineering/LAB7/ChromeDriverANDChromeTesting/chrome.exe
${CHROME_DRIVER_PATH}     E:/Software Engineering/LAB7/ChromeDriverANDChromeTesting/chromedriver.exe
${SERVER}                 localhost:7272
${BROWSER}                Chrome
${DELAY}                  0.01
${VALID USER}             demo
${VALID PASSWORD}         mode
${LOGIN URL}              http://${SERVER}/
${WELCOME URL}            http://${SERVER}/welcome.html
${ERROR URL}              http://${SERVER}/error.html

*** Keywords ***
Open Browser with Chrome for Testing
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}     Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}") 
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}

*** Test Cases ***
Show Form Page
    [Documentation]    UAT_LAB7_001: Travel Insurance Inquiry
    Open Browser with Chrome for Testing
    Go To   http://localhost:7272/Form.html

Record Success
    [Documentation]    UAT_LAB7_001: Travel Insurance Inquiry
    Set Selenium Speed    ${DELAY}
    Input Text   id=firstname     Somsong
    Input Text   id=lastname      Sandee
    Input Text   id=destination   Europe
    Input Text   id=contactperson    Sodsai Sandee
    Input Text   id=relationship     Mother
    Input Text   id=email         somsong@kkumail.com
    Input Text   id=phone      0811111234
    Click Button  id=submitButton
    Sleep         20s