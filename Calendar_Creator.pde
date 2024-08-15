// Final Project: Virtual Calendar Creator
// From 1800s to 2399s

// Importing packages 
import g4p_controls.*;

// Initializing variables

PFont font; // font used

// Calendar variables

int calYear = 0; // calendar year
int currMonth = 0; // month displayed
int temp = 0; // temporary variable

// Marker variables

// RGB values of marker colour
float[] markerCR = new float[12];
float[] markerCG = new float[12];
float[] markerCB = new float[12];

// Marker size
float markerS = 1;

boolean loadCal = false;
boolean saveCal = false;
boolean onMenuScreen = true;

// Creating calendar object
Calendar calendar = new Calendar(calYear); // calendar object

// Initializing variables for text files manipulated later
String[] fonts;
String[] shapes;

void setup() {
  
  // Setting the size and modes
  size(1015, 800);
  textAlign(CENTER);
  imageMode(CENTER);
  colorMode(RGB);

  // Creating the GUI
  createGUI();
  
  // Setting the initial marker colours
  for (int i = 0; i < 12; i++) {
    
    markerCR[i] = 255;
    markerCG[i] = 255;
    markerCB[i] = 255;
    
    calendar.markers[i] = new Marker(markerCR[i], markerCG[i], markerCB[i]);
    
  }
  
  // Reading the text files containing the list of fonts and icon shapes
  fonts =  loadStrings("list_572048");
  shapes = loadStrings("list_460381");
 
}

void draw() {
 
  // Displays menu screen when appropriate 
  if (loadCal == false) {
    menu();
  }    
  
  // Draws the calendar if possible (that is, it is a valid year)
  else if (calendar.year != 0 && loadCal == true && onMenuScreen == false) {
 
      try {
        
        // Clears the screen and sets the background
        clear();
        background(255);
        
        // Sets the default font
        if (calendar.monthFonts[currMonth] == null)
          calendar.monthFonts[currMonth] = fonts[0]; 
        
        // Loads the calendar    
        calendar.drawMonth();
        
        // Displays everything drawn with the marker
        calendar.markers[currMonth].drawOnScreen();
       
        // Saves the current calendar if prompted
        if (saveCal == true) {

          for (int i = 0; i < 12; i++) {

            currMonth = i;
            calendar.drawMonth();
            calendar.markers[currMonth].drawOnScreen();
            saveFrame("data/CALENDAR-" + calendar.year + "/" + calendar.months[currMonth] + ".png");
            
            clear();
            
            currMonth = temp;
            calendar.drawMonth();
            calendar.markers[currMonth].drawOnScreen();
            
          }
          
          // Resets the boolean variable
          currMonth = temp; 
          saveCal = false;

        }
        
      }
      
      catch (Exception e) {}

  }
 
}
