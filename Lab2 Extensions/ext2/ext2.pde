//----- Declaring global variables. -----

PVector position; //Variable for the position of the placed video frames.
PVector velocity; //Variable for adding to the position and moving the new frames.
PVector scaling; //Variable for the scaling factor of the new frames.
PVector scalingSpeed; //Variable for adding to the scaling factor and make the new frames increase size each run.

import processing.video.*; //Import video library for Processing.
Movie myMovie; //Variable for storing the video.

//----- PROGRAM -----

void setup () {
  
  size(1024,768); //Setting the window size.
  
  position = new PVector(-1,-2); //Initializing position vector.
  velocity = new PVector(1,2); //Initializing velocity vector.
  scaling = new PVector(0.1,0.1); //Initializing scaling vector.
  scalingSpeed = new PVector(0.001,0.001); //Initializing scalingSpeed vector.
  
  myMovie = new Movie(this, "small.mp4"); //Loading the video to myMovie.
  myMovie.loop(); //Plays the movie continuously, restarting it when it's over.
  
}

void draw () {
  
  position.add(velocity); //Adding velocity vector to the position vector to make each new frame to be in a new position.
  translate(position.x, position.y); //Translating the frames position each time the program runs.
  scaling.add(scalingSpeed); //Adding scalingSpeed to the scaling vector to make new frames increase size each run.
  scale(scaling.x, scaling.y); //Scaling the frames each time the program runs.
  image(myMovie, 0, 0); //Placing(drawing) the movie on the window.
  //myMovie.filter(GRAY); //Applying a grayscale filter to myImage each time the program runs.

}

// Called every time a new frame is available to read.
void movieEvent(Movie m) {
  m.read();
}
