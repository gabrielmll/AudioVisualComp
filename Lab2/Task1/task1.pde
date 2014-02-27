/* This program draws a new square each time it runs in a diferent place using translate
after adding the variable velocity to the variable position. */

//----- Declaring global variables. -----

PVector position; //Variable for the position of the drawn squares.
PVector velocity; //Variable for adding to the position and moving the new squares.

//----- PROGRAM -----

void setup () {
  
  position = new PVector(-1,-2); //Initializing position vector.
  velocity = new PVector(1,2); //Initializing velocity vector.
  
  size(700,700); //Setting the window size.
  
}

void draw () {
  
  position.add(velocity); //Adding velocity vector to the position vector to make each new square to be in a new position.
  translate(position.x, position.y); //Translating the square position each time the program runs.
  rect (0, 0, 200, 200); // Drawing the square.

}
