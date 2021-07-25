*** Keywords ***
Make Sure Nearest and Not Closed Store
  [Arguments]     ${open_store}
  BuiltIn.Sleep                               3
  DeviceUtility.Scroll To Element             xpath=//*[@text="${open_store}"]
  Page Should Not Contain Element             xpath=//*[@text="${open_store}"]/parent::*/parent::*/following-sibling::*[1]//*[@text='Closed']
  Click Element                               xpath=//*[@text="${open_store}"]
