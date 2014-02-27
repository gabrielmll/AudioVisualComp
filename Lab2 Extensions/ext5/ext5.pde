/* This program demonstrates a bouncing box that inverts its movement direction if it hits one of the set boundries*/

//----- Declaring global variables. -----

PVector position; //Variable for the position of the drawn box.
PVector velocity; //Variable for adding to the position and moving the box.

//----- PROGRAM -----

void setup () {

  position = new PVector(100, 100, -200); //Initializing position vector.
  velocity = new PVector(1, 3, 5); //Initializing velocity vector.

  size(1000, 700, P3D); //Setting the window size.
  background (0); //Set backgound to black.
}

void draw () {

  background (0); //Set backgound to black and erase last boxes.
  position.add(velocity); //Adding velocity vector to the position vector to make the box to be in a new position.
  translate(position.x, position.y, position.z); //Translating the box position each time the program runs.
  box (40); //Drawing a box.

  if (position.x > width || position.x < 0) //Invert direction of movement if the box horizontal position is bigger then the width of window or less then 0.
    velocity.x = velocity.x*-1; //Invert speed to invert direction of movement.

  if (position.y > height || position.y < 0) //Invert direction of movement if the box vertical position is bigger then the height of window or less then 0.
    velocity.y = velocity.y*-1; //Invert speed to invert direction of movement.

  if (position.z > 100 || position.z < -400) //Invert direction of movement if the box depth position is bigger then 100 or less then -40.
    velocity.z = velocity.z*-1; //Invert speed to invert direction of movement.
}
