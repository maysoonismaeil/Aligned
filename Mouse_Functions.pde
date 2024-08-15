// When the mouse is pressed on the screen
void mousePressed() {  
  addPoint();  
}

// When the mouse is dragged on the screen
void mouseDragged() {
  addPoint();
}

// When the mouse is released
void mouseReleased() {  
  calendar.markers[currMonth].states.set(calendar.markers[currMonth].states.size()-1, 1);  
}

// Creates a point at the mouse location
void addPoint() {
  
   // Creates a point at the location of the mouse
   PVector point = new PVector(mouseX, mouseY);
   calendar.markers[currMonth].points.add(point);

   // Allocates the colour and size of that point
   calendar.markers[currMonth].redColours.append(markerCR[currMonth]);
   calendar.markers[currMonth].greenColours.append(markerCG[currMonth]);
   calendar.markers[currMonth].blueColours.append(markerCB[currMonth]);
   calendar.markers[currMonth].states.append(0);

}
