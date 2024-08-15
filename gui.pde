/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:781282:
  appc.background(230);
} //_CODE_:window1:781282:

public void changeCalYear(GTextField source, GEvent event) { //_CODE_:calYearText:290256:
} //_CODE_:calYearText:290256:

public void loadCal(GButton source, GEvent event) { //_CODE_:loadCalButton:771175:

  loadCal = true;
  
  if (int(calYearText.getText()) <= 2399 && int(calYearText.getText()) >= 1800 && int(calYearText.getText()) != calendar.year) {   
    
    currMonth = 0;
    setControllerValues(); // resetting all controller values    
    calendar.year = int(calYearText.getText()); // setting the calendar year
    
  }
  
   // Moving off the menu screen (if a valid year is inputted)
  if (calendar.year <= 2399 && calendar.year >= 1800) 
    onMenuScreen = false;
  
} //_CODE_:loadCalButton:771175:

public void chooseCalMonth(GDropList source, GEvent event) { //_CODE_:calMonths:921314:

  if (onMenuScreen == false) {
    
    currMonth = calMonths.getSelectedIndex();
    temp = calMonths.getSelectedIndex();
    
    // Reset colour sliders
    textRed.setValue(calendar.currRedColours[currMonth]);
    textGreen.setValue(calendar.currGreenColours[currMonth]);
    textBlue.setValue(calendar.currBlueColours[currMonth]);
    
    // Reset marker sliders
    markerTintRed.setValue(markerCR[currMonth]);
    markerTintGreen.setValue(markerCG[currMonth]);
    markerTintBlue.setValue(markerCB[currMonth]);
    
    // Reset other variables
    bAWVar.setSelected(calendar.states[currMonth]);
    addIcons.setSelected(calendar.addIcons[currMonth]);
    selIcon.setSelected(calendar.iconTypesIndex[currMonth]);
    monthFont.setSelected(calendar.monthFontIndex[currMonth]);
    
  }
  
} //_CODE_:calMonths:921314:

public void changeTextRed(GSlider source, GEvent event) { //_CODE_:textRed:883966:
  
  if (calendar.states[currMonth] == false && onMenuScreen == false)
    calendar.monthRedColours[currMonth] = int(textRed.getValueF());
  
  calendar.currRedColours[currMonth] = int(textRed.getValueF());
  
} //_CODE_:textRed:883966:

public void changeTextGreen(GSlider source, GEvent event) { //_CODE_:textGreen:464368:
  
  if (calendar.states[currMonth] == false && onMenuScreen == false)
    calendar.monthGreenColours[currMonth] = int(textGreen.getValueF());
    
  calendar.currGreenColours[currMonth] = int(textGreen.getValueF());
  
} //_CODE_:textGreen:464368:

public void changeTextBlue(GSlider source, GEvent event) { //_CODE_:textBlue:441379:
  
  if (calendar.states[currMonth] == false && onMenuScreen == false)
    calendar.monthBlueColours[currMonth] = int(textBlue.getValueF());
    
  calendar.currBlueColours[currMonth] = int(textBlue.getValueF());
  
} //_CODE_:textBlue:441379:

public void blackAndWhiteCal(GCheckbox source, GEvent event) { //_CODE_:bAWVar:553613:
  
  // Creating a black and white calendar
  if (calendar.states[currMonth] == false && onMenuScreen == false) {
    
    calendar.monthRedColours[currMonth] = 255;
    calendar.monthGreenColours[currMonth] = 255;
    calendar.monthBlueColours[currMonth] = 255;
 
  }
  
  // Creating a coloured calendar
  else if (onMenuScreen == false) {

    calendar.monthRedColours[currMonth] = int(textRed.getValueF());
    calendar.monthGreenColours[currMonth] = int(textGreen.getValueF());
    calendar.monthBlueColours[currMonth] = int(textBlue.getValueF());
    
  }
  
  calendar.states[currMonth] = !(calendar.states[currMonth]);
  
} //_CODE_:bAWVar:553613:

public void changeMonthFonts(GDropList source, GEvent event) { //_CODE_:monthFont:572048:

  if (onMenuScreen == false) {
    
    calendar.monthFontIndex[currMonth] = monthFont.getSelectedIndex();
    calendar.monthFonts[currMonth] = fonts[monthFont.getSelectedIndex()];
    
  }
  
} //_CODE_:monthFont:572048:

public void applyToAllButton(GButton source, GEvent event) { //_CODE_:applyToAll:930681:

  for (int i = 0; i < 12; i++) {
    
    // Colour variables
    calendar.monthRedColours[i] = calendar.monthRedColours[currMonth];
    calendar.monthGreenColours[i] = calendar.monthGreenColours[currMonth];
    calendar.monthBlueColours[i] = calendar.monthBlueColours[currMonth];
    
    // Font variables
    calendar.monthFontIndex[i] = monthFont.getSelectedIndex();
    calendar.monthFonts[i] = fonts[monthFont.getSelectedIndex()];
    
    // More colour variables
    calendar.currRedColours[i] = int(textRed.getValueF());
    calendar.currGreenColours[i] = int(textGreen.getValueF());
    calendar.currBlueColours[i] = int(textBlue.getValueF());
    
    // Icon variables
    calendar.iconTypes[i] = calendar.iconTypes[currMonth];
    calendar.iconTypesIndex[i] = calendar.iconTypesIndex[currMonth];
    calendar.addIcons[i] = calendar.addIcons[currMonth];

    calendar.states[i] = calendar.states[currMonth];

  }
  
} //_CODE_:applyToAll:930681:

public void changeMarkerTintRed(GSlider source, GEvent event) { //_CODE_:markerTintRed:252638:
  markerCR[currMonth] = markerTintRed.getValueF();
} //_CODE_:markerTintRed:252638:

public void changeMarkerTintGreen(GSlider source, GEvent event) { //_CODE_:markerTintGreen:833061:
  markerCG[currMonth] = markerTintGreen.getValueF();
} //_CODE_:markerTintGreen:833061:

public void changeMarkerTintBlue(GSlider source, GEvent event) { //_CODE_:markerTintBlue:845539:
  markerCB[currMonth] = markerTintBlue.getValueF();
} //_CODE_:markerTintBlue:845539:

public void clearMarkerButton(GButton source, GEvent event) { //_CODE_:clearMarker:480218:
  calendar.markers[currMonth].clearScreen();
} //_CODE_:clearMarker:480218:

public void resetAllButton(GButton source, GEvent event) { //_CODE_:resetAll:435160:
  setControllerValues();
} //_CODE_:resetAll:435160:

public void downloadCalButton(GButton source, GEvent event) { //_CODE_:downloadCal:437164:
  saveCal = true;
  temp = currMonth;
} //_CODE_:downloadCal:437164:

public void menuButton(GButton source, GEvent event) { //_CODE_:menu:551549:
  exitToMenu();
} //_CODE_:menu:551549:

public void addIconsChecked(GCheckbox source, GEvent event) { //_CODE_:addIcons:714831:
  
  calendar.addIcons[currMonth] = !calendar.addIcons[currMonth];  
  
  // Adds icons to the current month
  if (calendar.addIcons[currMonth] == true) {
    
    calendar.iconTypes[currMonth] = shapes[selIcon.getSelectedIndex()];
    calendar.iconTypesIndex[currMonth] = selIcon.getSelectedIndex();
    
  }
    
} //_CODE_:addIcons:714831:

public void iconDrop(GDropList source, GEvent event) { //_CODE_:selIcon:460381:
  calendar.iconTypes[currMonth] = shapes[selIcon.getSelectedIndex()];
  calendar.iconTypesIndex[currMonth] = selIcon.getSelectedIndex();
} //_CODE_:selIcon:460381:

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "CONTROLS", 0, 0, 380, 520, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  label1 = new GLabel(window1, 15, 12, 79, 20);
  label1.setText("CONTROLS:");
  label1.setOpaque(true);
  calYearText = new GTextField(window1, 105, 12, 95, 18, G4P.SCROLLBARS_NONE);
  calYearText.setPromptText("Enter year here");
  calYearText.setOpaque(false);
  calYearText.addEventHandler(this, "changeCalYear");
  loadCalButton = new GButton(window1, 213, 11, 97, 20);
  loadCalButton.setText("Load Calendar");
  loadCalButton.addEventHandler(this, "loadCal");
  calMonths = new GDropList(window1, 245, 48, 90, 78, 2, 8);
  calMonths.setItems(loadStrings("list_921314"), 0);
  calMonths.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  calMonths.addEventHandler(this, "chooseCalMonth");
  label2 = new GLabel(window1, 15, 48, 219, 20);
  label2.setText("CHOOSE MONTH TO BE DISPLAYED:");
  label2.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  label2.setOpaque(true);
  label3 = new GLabel(window1, 15, 136, 342, 20);
  label3.setText("Month Colour (Amount of Red Tint, Green Tint, and Blue Tint):");
  label3.setLocalColorScheme(GCScheme.RED_SCHEME);
  label3.setOpaque(true);
  label4 = new GLabel(window1, 15, 91, 206, 20);
  label4.setText("DRAG ON THE SCREEN TO DRAW!");
  label4.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  label4.setOpaque(true);
  textRed = new GSlider(window1, 15, 174, 100, 40, 10.0);
  textRed.setShowValue(true);
  textRed.setShowLimits(true);
  textRed.setLimits(0, 0, 100);
  textRed.setNumberFormat(G4P.INTEGER, 0);
  textRed.setLocalColorScheme(GCScheme.RED_SCHEME);
  textRed.setOpaque(false);
  textRed.addEventHandler(this, "changeTextRed");
  textGreen = new GSlider(window1, 137, 174, 100, 40, 10.0);
  textGreen.setShowValue(true);
  textGreen.setShowLimits(true);
  textGreen.setLimits(0, 0, 100);
  textGreen.setNumberFormat(G4P.INTEGER, 0);
  textGreen.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  textGreen.setOpaque(false);
  textGreen.addEventHandler(this, "changeTextGreen");
  textBlue = new GSlider(window1, 258, 174, 100, 40, 10.0);
  textBlue.setShowValue(true);
  textBlue.setShowLimits(true);
  textBlue.setLimits(0, 0, 100);
  textBlue.setNumberFormat(G4P.INTEGER, 0);
  textBlue.setOpaque(false);
  textBlue.addEventHandler(this, "changeTextBlue");
  bAWVar = new GCheckbox(window1, 245, 92, 105, 20);
  bAWVar.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  bAWVar.setText("Classic (B&W)");
  bAWVar.setLocalColorScheme(GCScheme.RED_SCHEME);
  bAWVar.setOpaque(true);
  bAWVar.addEventHandler(this, "blackAndWhiteCal");
  label5 = new GLabel(window1, 15, 231, 186, 20);
  label5.setText("Month Fonts (Choose From Six):");
  label5.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  label5.setOpaque(true);
  monthFont = new GDropList(window1, 15, 263, 147, 66, 2, 10);
  monthFont.setItems(loadStrings("list_572048"), 0);
  monthFont.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  monthFont.addEventHandler(this, "changeMonthFonts");
  applyToAll = new GButton(window1, 227, 240, 129, 40);
  applyToAll.setText("Apply Current Format to All Other Months");
  applyToAll.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  applyToAll.addEventHandler(this, "applyToAllButton");
  label6 = new GLabel(window1, 15, 301, 341, 20);
  label6.setText("Marker Colour (Amount of Red Tint, Green Tint, and Blue Tint):");
  label6.setOpaque(true);
  markerTintRed = new GSlider(window1, 18, 335, 100, 40, 10.0);
  markerTintRed.setShowValue(true);
  markerTintRed.setShowLimits(true);
  markerTintRed.setLimits(255, 0, 255);
  markerTintRed.setNumberFormat(G4P.INTEGER, 0);
  markerTintRed.setLocalColorScheme(GCScheme.RED_SCHEME);
  markerTintRed.setOpaque(false);
  markerTintRed.addEventHandler(this, "changeMarkerTintRed");
  markerTintGreen = new GSlider(window1, 136, 335, 100, 40, 10.0);
  markerTintGreen.setShowValue(true);
  markerTintGreen.setShowLimits(true);
  markerTintGreen.setLimits(255, 0, 255);
  markerTintGreen.setNumberFormat(G4P.INTEGER, 0);
  markerTintGreen.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  markerTintGreen.setOpaque(false);
  markerTintGreen.addEventHandler(this, "changeMarkerTintGreen");
  markerTintBlue = new GSlider(window1, 258, 335, 100, 40, 10.0);
  markerTintBlue.setShowValue(true);
  markerTintBlue.setShowLimits(true);
  markerTintBlue.setLimits(255, 0, 255);
  markerTintBlue.setNumberFormat(G4P.INTEGER, 0);
  markerTintBlue.setOpaque(false);
  markerTintBlue.addEventHandler(this, "changeMarkerTintBlue");
  clearMarker = new GButton(window1, 18, 460, 82, 40);
  clearMarker.setText("Clear Marker");
  clearMarker.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  clearMarker.addEventHandler(this, "clearMarkerButton");
  resetAll = new GButton(window1, 107, 460, 63, 40);
  resetAll.setText("Reset Month");
  resetAll.addEventHandler(this, "resetAllButton");
  downloadCal = new GButton(window1, 177, 460, 120, 40);
  downloadCal.setText("Download Calendar");
  downloadCal.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  downloadCal.addEventHandler(this, "downloadCalButton");
  menu = new GButton(window1, 305, 460, 53, 40);
  menu.setText("Menu");
  menu.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  menu.addEventHandler(this, "menuButton");
  label7 = new GLabel(window1, 19, 390, 221, 20);
  label7.setText("Additional Icons (Dot, Square, Triangle):");
  label7.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  label7.setOpaque(true);
  addIcons = new GCheckbox(window1, 20, 420, 114, 20);
  addIcons.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  addIcons.setText("Additional Icons");
  addIcons.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  addIcons.setOpaque(true);
  addIcons.addEventHandler(this, "addIconsChecked");
  selIcon = new GDropList(window1, 145, 420, 90, 80, 3, 10);
  selIcon.setItems(loadStrings("list_460381"), 0);
  selIcon.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  selIcon.addEventHandler(this, "iconDrop");
  label8 = new GLabel(window1, 260, 385, 91, 56);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("*WILL BE ADDED TO EACH DATE*");
  label8.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  label8.setOpaque(true);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GLabel label1; 
GTextField calYearText; 
GButton loadCalButton; 
GDropList calMonths; 
GLabel label2; 
GLabel label3; 
GLabel label4; 
GSlider textRed; 
GSlider textGreen; 
GSlider textBlue; 
GCheckbox bAWVar; 
GLabel label5; 
GDropList monthFont; 
GButton applyToAll; 
GLabel label6; 
GSlider markerTintRed; 
GSlider markerTintGreen; 
GSlider markerTintBlue; 
GButton clearMarker; 
GButton resetAll; 
GButton downloadCal; 
GButton menu; 
GLabel label7; 
GCheckbox addIcons; 
GDropList selIcon; 
GLabel label8; 
