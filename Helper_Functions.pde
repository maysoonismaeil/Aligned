// Drawing the menu screen
void menu() {
  
  // Setting the text and background
     
  // Creating the font
  font = createFont("Candara Bold Italic", 40);
  textFont(font);
  
  textSize(40);
  background(179, 205, 224);
  
  stroke(3, 57, 108, 50);
  strokeWeight(3);
  
 // Drawing the grid lines
 
  for (int i = 0; i < height; i += height/8)       
    line(0, i+50, width, i+50);

  for (int i = 0; i < width; i += width/8)
    line(i+50, 0, i+50, height);
  
  // Displaying the menu text
  
  fill(3, 57, 108);  
  
  textSize(40);
  text("ALIGNED", (width/2), (height/2)-5);
  
  textSize(20);
  text("Create your dream calendar today!", (width/2)+1, (height/2)+30);
  
  textSize(12);
  text("Brought to you by one of the creators of Enhancem!", (width/2)+1, (height/2)+65);

}

// Exiting to the menu
void exitToMenu() {

  // Resetting variables
  loadCal = false;
  onMenuScreen = true;
  calendar.year = 0;

  setControllerValues();

}

// Resetting all controller values
void setControllerValues() {
  
  // Calendar variables
  monthFont.setSelected(0);
  selIcon.setSelected(0);
  calYearText.setText(null);

  // Marker variables
  markerTintRed.setValue(255);
  markerTintGreen.setValue(255);
  markerTintBlue.setValue(255);

  // Text variables
  textRed.setValue(0);
  textGreen.setValue(0);
  textBlue.setValue(0);
  
  // Other variables
  bAWVar.setSelected(false);
  addIcons.setSelected(false);
  
  // Calendar variables
  calendar.states[currMonth] = false;
  calendar.addIcons[currMonth] = false;
  calendar.monthFontIndex[currMonth] = 0;
  calendar.monthFonts[currMonth] = "Candara";
  
  // Colour variables
  calendar.monthRedColours[currMonth] = 0;
  calendar.monthGreenColours[currMonth] = 0;
  calendar.monthBlueColours[currMonth] = 0;
  
  calendar.markers[currMonth].clearScreen();

  // Calendar complete reset
  if (onMenuScreen == true || int(calYearText.getText()) != calendar.year) {
  
    currMonth = 0; // resetting the current month
    calendar.reset(); // resetting the calendar variables
    calMonths.setSelected(0);
  
    // Resetting the marker colours
    for (int i = 0; i < 12; i++) {
      
      markerCR[i] = 255;
      markerCG[i] = 255;
      markerCB[i] = 255;
      
      calendar.markers[i] = new Marker(markerCR[i], markerCG[i], markerCB[i]);
      
      // Clearing the screen of any drawings
      calendar.markers[i].clearScreen();
   
    }
    
  } 
  
}
