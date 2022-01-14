*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
# invalid_login and valid_login from https://medium.com/edureka/robot-framework-tutorial-f8a75ab23cfd
Library           SeleniumLibrary
 
*** Variables ***
${SERVER}         localhost:5000
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome
${ERROR URL}      http://${SERVER}/error
${EXAMPLE URL}      http://${SERVER}/example
 
*** Keywords ***
Open Browser To Login Page
    Create Webdriver    ${BROWSER}    executable_path=C:\\Users\\sandr\\AppData\\Local\\rasjani\\WebDriverManager\\chrome\\97.0.4692.71\\chromedriver_win32\\chromedriver.exe
    Go To    ${LOGIN URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open
 
Login Page Should Be Open
    Title Should Be    Login Page
 
Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Go To Example Page
    Go To    ${EXAMPLE URL}
 
Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}
 
Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}
 
Submit Credentials
    Click Button    login_button
 
Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page