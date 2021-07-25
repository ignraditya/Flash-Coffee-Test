*** Keywords ***
Get Device Dimensions
    ${SIZE}=                                    Get Element Size                                                                          xpath=(//android.widget.FrameLayout)[2]
    ${values}=                                  Get Dictionary Values                                                                     ${SIZE}
  #size tinggi devices
    ${HEIGHT}=                                  Get From List                                                                             ${values}                                           0
  #size lebar devices
    ${WIDTH}=                                   Get From List                                                                             ${values}                                           1
    Set Global Variable                         ${WIDTH}
    Set Global Variable                         ${HEIGHT}

Get Top Height General On Home
    Wait Until Element Is Visible               xpath=//*[@resource-id="${APP_PACKAGE}:id/action_bar_root"]                             timeout=3
    ${source}=      Log Source
    ${coordinate}=  XML.Get Element Attribute   ${source}   bounds   .//*[@resource-id="${APP_PACKAGE}:id/action_bar_root"]
    ${TOP_HEIGHT}=  Get Top Bound               ${coordinate}
    Set Global Variable                         ${TOP_HEIGHT}

Scroll To Element
    [Arguments]         ${element}
    FOR  ${count}  IN RANGE  0  20
        ${status}           Run Keyword And Return Status           Element Should Be Visible        ${element}
        Exit For Loop If  ${status}==${true}
        Swipe Up Half From Bottom
    END
    ${final_status}            Run Keyword And Return Status       Element Should Be Visible        ${element}
    Should Be Equal            ${final_status}          ${TRUE}         error=Element is not visible

Swipe Up Half From Bottom
    ${start_x}=             Evaluate      ${WIDTH} / 2
    ${start_y}=             Evaluate      ${HEIGHT} * 0.8
    ${end_x}=               Evaluate      ${WIDTH} / 2
    ${end_y}=               Evaluate      ${HEIGHT} * 0.5
    BuiltIn.Sleep           0.375
    AppiumLibrary.Swipe     ${start_x}    ${start_y}    ${end_x}    ${end_y}    1000
