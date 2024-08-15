class Marker {

  // FIELDS
  
  float x, y;
  float size;
  color colour; 
  
  // Arrays of the position, colour, and size of points made by the marker
  ArrayList<PVector> points;
  FloatList redColours;
  FloatList greenColours;
  FloatList blueColours;
  FloatList sizes;
  IntList states;
  
  // CONSTRUCTOR
   
  Marker(float mcr, float mcg, float mcb) { 
    
    this.colour = color(mcr, mcg, mcb);
    this.size = markerS;
    this.x = mouseX;
    this.y = mouseY;
    
    this.points = new ArrayList<PVector>();
    this.redColours = new FloatList();
    this.greenColours = new FloatList();
    this.blueColours = new FloatList();
    this.states = new IntList();

  }
  
  // METHODS
  
  // Displaying everything drawn by the user
  void drawOnScreen() {

    // Drawing lines (or curves) the user makes 
    for ( int i = 0; i < this.points.size(); i++ ) { 
      
      try {
        
        // Connecting the trail of points made by the user when dragging the mouse
        if (this.states.get(i-1) == 0) { // only connects consecutive points
          
          strokeWeight(markerS);
          stroke(this.redColours.get(i), this.greenColours.get(i), this.blueColours.get(i));
          line(this.points.get(i).x, this.points.get(i).y, this.points.get(i-1).x, this.points.get(i-1).y);
          
        } 
        
      }
      
      catch (Exception e) {}
      
    }
    
  }

  // Clearing the screen of any marker
  void clearScreen() {
    
     // Emptying the necessary arrays
     this.points = new ArrayList<PVector>();
     this.redColours = new FloatList();
     this.greenColours = new FloatList();
     this.blueColours = new FloatList();
     this.sizes = new FloatList();
     this.states = new IntList();
    
  }
 
}
