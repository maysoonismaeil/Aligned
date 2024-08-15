class Calendar {
    
  // FIELDS
   
  int year, leap; // the calendar year and a leap variable to manipulate later
  int[] monthsLengths = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}; // the lengths of the months
  
  String[] months =  {"JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"};
  String[] daysOfWeek = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
  String[] monthFonts; // the fonts for each month
  String[] iconTypes; // the icons for each month
  
  int[] iconTypesIndex; // created to manipulate later
  int[] monthFontIndex; // created to manipulate later
  
  // Month colours
  int[] currRedColours;
  int[] currGreenColours;
  int[] currBlueColours;  
  int[] monthRedColours;
  int[] monthGreenColours;
  int[] monthBlueColours;
  
  // Boolean variables
  boolean leapYear;
  boolean[] states;
  boolean[] addIcons;
 
  // Marker objects
  Marker[] markers; // one for each month
 
  // CONSTRUCTOR
   
  Calendar(int year) { 
    
    this.year = year;
    this.markers = new Marker[12];
    this.monthFonts = new String[12];
    this.iconTypes = new String[12];
    this.iconTypesIndex = new int[12];
    this.monthFontIndex = new int[12];
    this.monthRedColours = new int[12];
    this.monthGreenColours = new int[12];
    this.monthBlueColours = new int[12];
    this.currRedColours = new int[12];
    this.currGreenColours = new int[12];
    this.currBlueColours = new int[12];
    this.states = new boolean[12];
    this.addIcons = new boolean[12];

  }
  
  // METHODS
  
  // Draws the current month
  void drawMonth() {
  
    // Setting the text and background
    font = createFont(this.monthFonts[currMonth], 40);
    textFont(font);
    strokeWeight(3);
      
    // Setting the background colour and a lighter version of that colour as the text and grid colour 
    background(this.monthRedColours[currMonth], this.monthGreenColours[currMonth], this.monthBlueColours[currMonth]);
    
    if (this.monthRedColours[currMonth] != 255 && this.monthGreenColours[currMonth] != 255 && this.monthBlueColours[currMonth] != 255) {

      stroke((255-this.monthRedColours[currMonth])*0.8+this.monthRedColours[currMonth], (255-this.monthGreenColours[currMonth])*0.8+this.monthGreenColours[currMonth], (255-this.monthBlueColours[currMonth])*0.8+this.monthBlueColours[currMonth], 80);           
      fill((255-this.monthRedColours[currMonth])*0.8+this.monthRedColours[currMonth], (255-this.monthGreenColours[currMonth])*0.8+this.monthGreenColours[currMonth], (255-this.monthBlueColours[currMonth])*0.8+this.monthBlueColours[currMonth]);  
      
    }
    
    else {
      
      stroke(0);
      fill(0);
    
    }
    
    // Displays the currently selected month
    text(months[currMonth]+ " " + this.year, (width/2), 48);
  
    line(0, 70, width, 70);
    textSize(20);
    
    // Displays the days of the week
    for (int i = 0; i < 7; i += 1) {
      
      if (i == 6)
        text(daysOfWeek[i], (width/16)+(width/7)*i+12, 91);
      
      else 
        text(daysOfWeek[i], (width/16)+(width/7)*i+6, 91);
        
    }
    
    // Drawing the columns (the days of the week)
    for (int i = 0; i < width; i += width/7)       
      line(i-3, 70, i, height);
    
    // Drawing the rows (the weeks of the month)
    for (int i = 100; i < height; i += (height-100)/6)
      line(0, i, width, i);
      
    getLengthOfMonths(); // getting the length of each month

    int[] xValues = {125, 270, 415, 560, 705, 850, 995};
    int[] yValues = {125, 242, 357, 472, 587, 702, 817};
    int r = 0;
    int c = 0;
    
    int firstDay = getDayOfWeek(1, currMonth, str(this.year)); // calculating the day of the week for the first day of the current month
    
    // Displaying the current month's days (in their accurate positions)
    for (int i = 0; i < this.monthsLengths[currMonth]; i++) {  
      
      if (r == 0) {

        text(i+1, xValues[firstDay+i], yValues[0]);

        // Adds the icons (if applicable)
        if (this.addIcons[currMonth] == true) {

          if (this.iconTypes[currMonth].equals("Dot"))
            ellipse(xValues[firstDay+i]-20, yValues[0]-5, 5, 5);
          
          else if (this.iconTypes[currMonth].equals("Square"))
            rect(xValues[firstDay+i]-20, yValues[0]-8, 5, 5);
          
          else if (this.iconTypes[currMonth].equals("Triangle")) 
            triangle(xValues[firstDay+i]-30, yValues[0], xValues[firstDay+i]-25, yValues[0]-8, xValues[firstDay+i]-20, yValues[0]);          

        }
        
        if (getDayOfWeek(1, currMonth, str(this.year))+i == 6)
          r = 1;       
        
      }

      else {
        
        text(i+1, xValues[c], yValues[r]);
        
        // Adds the icons (if applicable)
        if (this.addIcons[currMonth] == true) {
          
          if (this.iconTypes[currMonth].equals("Dot")) 
            ellipse(xValues[c]-20, yValues[r]-5, 5, 5);
          
          else if (this.iconTypes[currMonth].equals("Square")) 
            rect(xValues[c]-20, yValues[r]-8, 5, 5);
          
          else if (this.iconTypes[currMonth].equals("Triangle"))   
            triangle(xValues[c]-30, yValues[r], xValues[c]-25, yValues[r]-8, xValues[c]-20, yValues[r]);
           
        }
        
        c++;
                
        if (c == 7) {
          
          r++;
          c = 0;
          
        } 
        
      }

    }
      
  }

  // Determining if given year is leap year
  void isLeapYear() { 

    // Checking if year is divisible by four and NOT divisible by one hundred OR divisible by four hundred 
    if (this.year%4 == 0 && (this.year%100 != 0 || this.year%400 == 0))
      this.leapYear = true;
    
    else
      this.leapYear = false;

  }
  
  // Determining the number of days in each month
  void getLengthOfMonths() {
    
    isLeapYear();
    
    // Leap year (February has 29 days)
    if (this.leapYear == true)
      this.monthsLengths[1] = 29;

    // Non-leap year (February has 28 days)
    else
      this.monthsLengths[1] = 28;

  }
  
  // Calculating the day of the week of a certain date
  int getDayOfWeek(int d, int m, String y) {
    
    // Derived from: https://artofmemory.com/blog/how-to-calculate-the-day-of-the-week/
    
    int begOfY = int(y.substring(0, 2)); // the beginning of the year (eg. "19")
    int endOfY = int(y.substring(y.length()-2, y.length())); // the end of the year (eg. "27")
    int yc = (endOfY+(endOfY/4))%7; // the year code
    int cc;
    
    int[] monthCodes = {0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5};
    int[] centuryCodes = {4, 2, 0, 6, 4, 2, 0};
    
    cc = centuryCodes[begOfY-17]; // the century code

    // Determining the leap year code
    if (this.leapYear == true && (m == 0 || m == 1))
      this.leap = 1;
    
    else
      this.leap = 0;

    int dayOfWeek = (yc + monthCodes[m] + cc + d - this.leap)%7; // calculates the day of the week (0 being Sunday and 6 being Saturday)
    return dayOfWeek;
    
  }
  
  // Resetting all of the variables
  void reset() {
    
    this.markers = new Marker[12];
    this.monthFonts = new String[12];
    this.iconTypes = new String[12];
    this.iconTypesIndex = new int[12];
    this.monthFontIndex = new int[12];
    this.monthRedColours = new int[12];
    this.monthGreenColours = new int[12];
    this.monthBlueColours = new int[12];
    this.currRedColours = new int[12];
    this.currGreenColours = new int[12];
    this.currBlueColours = new int[12];
    this.addIcons = new boolean[12];
    this.states = new boolean[12];
  
  }

}
