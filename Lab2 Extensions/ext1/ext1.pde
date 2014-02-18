//----- Declaring global variables. -----

PVector position; //Variable for the position of the moving shapes.
PVector velocity; //Variable for adding to the position and moving shapes.


//----- PROGRAM -----

void setup () {
  
  position = new PVector(-1,-1); //Initializing position vector.
  velocity = new PVector(1,1); //Initializing velocity vector.

  size(700,700); //Setting the window size.
  
}

void draw () {
  
  //The next four lines will draw a black and a white squares on top-right corner, and bottom-left corner to prove that after popping the matrix back, the coordinate system gets back to the original place. 
  fill(0);
  rect(600,0,100,100);
  fill(255);
  rect(0,600,100,100);

  pushMatrix(); //Saves the current coordinate system in the stack, allowing the following changes to be made and then revert the system back to original using popMatrix().
  position.add(velocity); //Adding velocity vector to the position vector to make each new shape to be in a new position.
  translate(position.x, position.y); //Translating the shapes positions each time the program runs.
  square(); //Call the square function.
  circle(); //Call the circle function.
  triang(); //Call the triang dunction.
  popMatrix(); //Reverts the changes to the coordinate system back to the original state it was before pushMatrix().


}


