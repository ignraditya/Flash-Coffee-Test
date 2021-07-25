*** Settings ***
Resource              ../resources.robot
Suite Setup           Spawn Appium Server
Suite Teardown        Close Appium Server

*** Test Case ***
Flash Coffee Test
  Homepage.Verify Pick Up At
  Homepage.Verify Location Selected
  ${chosen_location}=                                         Homepage.Get Selected Location Name
  Homepage.Click Choose Location
  ChooseLocation.Make Sure Nearest and Not Closed Store       ${chosen_location}
  Homepage.Click BurgerBar
  SettingsMenu.Verify Wordings in English                     Sign In          Language
  SettingsMenu.Change To Bahasa Indonesia
  Homepage.Click BurgerBar
  SettingsMenu.Verify Already Changed To Bahasa Indonesia     Bahasa           Masuk
