//----- Declaring global variables. -----

PVector position; //Variable for the position of the drawn squares.
PVector velocity; //Variable for adding to the position and moving the new squares.
PVector scaling; //Variable for the scaling factor of the new squares.
PVector scalingSpeed; //Variable for adding to the scaling factor and make the new squares increase size each run.

//----- PROGRAM -----

void setup () {
  
  position = new PVector(-1,-2); //Initializing position vector.
  velocity = new PVector(1,2); //Initializing velocity vector.
  scaling = new PVector(0.1,0.1); //Initializing scaling vector.
  scalingSpeed = new PVector(0.01,0.01); //Initializing scalingSpeed vector.
  
  size(700,700); //Setting the window size.
  
}

void draw () {
  
  position.add(velocity); //Adding velocity vector to the position vector to make each new square to be in a new position.
  translate(position.x, position.y); //Translating the square position each time the program runs.
  scaling.add(scalingSpeed); //Adding scalingSpeed to the scaling vector to make new squares increase size each run.
  scale(scaling.x, scaling.y); //Scaling the square each time the program runs.
  rect (0, 0, 200, 200); // Drawing the square.

}
