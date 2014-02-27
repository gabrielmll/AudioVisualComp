/* This program shows how to draw shapes using the beginShape command. */

//----- Declaring global variables. -----

PImage img;  // variable for an image

//----- PROGRAM -----

void setup(){
  
size(500, 500);  // Sets the window size.

// Creating a shape.
beginShape();  // Start drawing the shape.
// Each vertex(coodinate x, coordinate y) of the shape.
vertex(100, 100);
vertex(100, 200);
vertex(200, 200);
vertex(200, 100);
endShape(CLOSE);  // Stops to draw the shape.

//  3.
//  Removing the word "CLOSE" in endShape(CLOSE) will make the shape unclosed.
//  As can be seen in the following example, there's no drawn line closing the square.

// Creating a shape.
beginShape();  // Start drawing the shape.
// Each vertex (coodinate x, coordinate y) of the shape.
vertex(300, 100);
vertex(300, 200);
vertex(400, 200);
vertex(400, 100);
endShape();  // Stops to draw the shape WITHOUT the word "CLOSE".

//  4.
//  Playing with the vertices.

//  Creating a shape.
beginShape();  // // Start drawing the shape.
// Each vertex (coodinate x, coordinate y) of the shape.
vertex(200, 300);
vertex(100, 400);
vertex(400, 400);
vertex(300, 300);
endShape(CLOSE);  // Stops to draw the shape.

}
