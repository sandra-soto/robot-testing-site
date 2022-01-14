*** Settings ***
Documentation     A test suite containing examples of robot interacting with UI elements.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Example Page
# Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot
 
*** Variables ***
${AlertText}    showing alert
${AcceptanceText}   correct
${RejectionText}   incorrect

${number}   45
${nonNumber}    abc


*** Test Cases ***
Alert Should Not Be Shown On Start
    Alert Should Not Be Present
Alert Should Be Shown When Prompted
    Click Button    showAlert
    Alert Should Be Present
Alert Should Show Correct Text
    Click Button    showAlert
    Alert Text Should Match     ${AlertText}

Prompt Should Show Acceptance Message
    Click Button    showPrompt  
    Input Text Into Alert       ${number}  action=ACCEPT 
    Alert Text Should Match     ${AcceptanceText} 
Prompt Should Show Rejection Message
    Click Button    showPrompt  
    Input Text Into Alert       ${nonNumber}  action=ACCEPT 
    Alert Text Should Match     ${RejectionText} 

Checkbox Should Be Disabled
    Element Should Be Disabled  disabledCheckbox
Checkbox Should Be Selected On Start
    Checkbox Should Be Selected     checkbox




    
 
*** Keywords ***

Alert Text Should Match
    [Arguments]    ${givenText}
    ${message} =	Handle Alert
    Should Be Equal As Strings    ${message}   ${givenText}

