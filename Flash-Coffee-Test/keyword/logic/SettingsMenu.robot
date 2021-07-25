*** Keywords ***
Click Language
  Wait Until Element Is Visible       xpath=//*[@text="Language"]       timeout=3
  Click Element                       xpath=//*[@text="Language"]

Verify In Language Settings
  Wait Until Element Is Visible       xpath=//*[@text="Select Language"]        timeout=3

Choose Bahasa Indonesia
  Wait Until Element Is Visible       xpath=//*[@text="Bahasa Indonesia"]/preceding-sibling::*/*          timeout=3
  Click Element                       xpath=//*[@text="Bahasa Indonesia"]/preceding-sibling::*/*

Click Save Button
  Click Element                       xpath=//*[@text="Save"]

Verify Wordings in English
  [Arguments]     ${signin}     ${language}
  Wait Until Element Is Visible       xpath=//*[@text="${signin}"]        timeout=3
  Wait Until Element Is Visible       xpath=//*[@text="${language}"]      timeout=3

Change To Bahasa Indonesia
  SettingsMenu.Click Language
  SettingsMenu.Verify In Language Settings
  SettingsMenu.Choose Bahasa Indonesia
  SettingsMenu.Click Save Button

Verify Already Changed To Bahasa Indonesia
  [Arguments]     ${bahasa}     ${masuk}
  Wait Until Element Is Visible       xpath=//*[@text="${bahasa}"]         timeout=3
  Wait Until Element Is Visible       xpath=//*[@text="${masuk}"]          timeout=3
