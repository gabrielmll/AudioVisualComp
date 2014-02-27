/* This program demonstrates a bouncing box that inverts its movement direction if it hits one of the edges of the window*/

//----- Declaring global variables. -----

PVector position; //Variable for the position of the drawn squares.
PVector velocity; //Variable for adding to the position and moving the new squares.

//----- PROGRAM -----

void setup () {

  position = new PVector(-1, -2); //Initializing position vector.
  velocity = new PVector(1, 3); //Initializing velocity vector.

  size(1000, 700); //Setting the window size.
}

void draw () {

  position.add(velocity); //Adding velocity vector to the position vector to make each new square to be in a new position.
  translate(position.x, position.y); //Translating the square position each time the program runs.
  rect (0, 0, 100, 100); //Drawing the square.

  if (position.x > width-100 || position.x < 0) //Invert direction of movement if the sqaure horizontal position is bigger then the width of window or less then 0.
    velocity.x = velocity.x*-1; //Invert speed to invert direction of movement.

  if (position.y > height-100 || position.y < 0) //Invert direction of movement if the square vertical position is bigger then the height of window or less then 0.
    velocity.y = velocity.y*-1; //Invert speed to invert direction of movement.
}
