// Code developed based on 2-D Transformations tutorial on Processing's website. Link: http://processing.org/tutorials/transform2d/

/* This program draws a robot with articulated arms that can be moved automatically or by input.
Type E to toggle between automatic and manual.
Press W to move arms up and S to move down. */

//----- Declaring global variables. -----

int armAngle = 0; // Variable for the rotation of the arms.
int angleChange = 5; // Variable to increment on the angle of the arm rotation.
final int ANGLE_LIMIT = 135; // Variable for the limit of the arms rotation.
boolean wave = false; // Boolean to check if waving arms.

PImage bg; //Variable for background image.

//----- PROGRAM -----

void setup()
{
  bg = loadImage("gradient.png"); // Load background image.

  size(500, 500); // Set window size.
  smooth(); // Anti-alias for shapes.
  frameRate(30); // Set 30 frames per second.
}

void draw() 
{
  background(bg); // Set background image.
  instructions(); // Draw instructions.
  
  pushMatrix();
  translate(width/2, height/2); // Place robot on the center of screen.
  drawRobot(); // Call drawRobot function.

  if (wave) { // Check if wave is true and start to wave.
  
    armAngle += angleChange; // Increment the angle of rotation.

    if (armAngle > ANGLE_LIMIT || armAngle < 0) // If the arm has moved past its limit, reverse direction and set within limits.
    {
      angleChange = -angleChange; // Reverse direction of rotation.
      armAngle += angleChange; // Increment the angle of rotation.
    }
  }


  popMatrix();
}



//----- FUNCTIONS -----

void drawRobot() //Draws the Robot.
{
  noStroke(); //Remove all strokes.

  //ARMS
  fill(200); // Set limb colour to light gray.
  drawLeftArm(); // Call drawLeftArm function.
  fill(200); // Set limb colour to light gray.
  drawRightArm(); // Call drawRightArm function.

  //SHOULDERS
  fill(150); // Set shoulder colour to dark gray.
  ellipse(-50, -20, 30, 30); // left shoulder
  ellipse(50, -20, 30, 30);  // right shoulder

  //LEGS
  fill(200); // Set limb colour to light gray.
  rect(-38, 85, 16, 60); // left leg
  rect(22, 85, 16, 60); // right leg
  fill(50); // Set wheel colour to black.
  ellipse(-30, 155, 40, 40); // left wheel
  ellipse(30, 155, 40, 40); // right wheel
  fill(150);
  ellipse(-30, 75, 30, 30); // left knee
  ellipse(30, 75, 30, 30);  // right knee

  //ANTHENA
  fill(200); //Set colour to llight gray.
  rect(-5, -155, 10, 50); // anthena
  fill(75, 196, 232); // Set colour to blue.
  ellipse(0, -155, 20, 20); //anthena bulb

  //HEAD AND BODY  
  fill(255, 194, 79); // Set body colour to yellow.
  ellipse(0, -75, 100, 100); // head
  rect(-50, -75, 100, 150); // body

  //EYES
  fill(75, 196, 232);
  ellipse(-25, -90, 20, 20); // left eye
  ellipse(25, -90, 20, 20);  // right eye
}

void drawLeftArm() // Rotates and draws right arm.
{
  pushMatrix();
  translate(-50, -20); // Move matrix.
  rotate(radians(armAngle)); //Rotate matrix.
  rect(-8, 0, 16, 80); // left arm
  fill(75, 196, 232); // Set hand colour to blue.
  ellipse(0, 80, 30, 30); // left hand
  popMatrix();
}

void drawRightArm() // Rotates and draws right arm.
{
  pushMatrix();
  translate(50, -20); // Move matrix.
  rotate(radians(-armAngle)); //Rotate matrix.
  rect(-8, 0, 16, 80); // right arm
  fill(75, 196, 232); // Set hand colour to blue.
  ellipse(0, 80, 30, 30); // right hand
  popMatrix();
}
