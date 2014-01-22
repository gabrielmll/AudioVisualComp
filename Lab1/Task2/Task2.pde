PImage img;  // variable for an image

//img = loadImage("arara.jpg");  // loading an image to the image variable

size(500, 500);  // determining the size of the window

// Creating a shape
beginShape();  // start recording the shape
//each vertice(coodinate x, coordinate y) of the shape
vertex(100, 100);
vertex(100, 200);
vertex(200, 200);
vertex(200, 100);
endShape(CLOSE);  // stop recording the shape

// 3.
//  Removing the word "CLOSE" in endShape(CLOSE) will make the shape unclosed.
//  As can be seen in the following example, there's no drawn line closing the square 

// Creating a shape
beginShape();  // start recording the shape
//each vertice(coodinate x, coordinate y) of the shape
vertex(300, 100);
vertex(300, 200);
vertex(400, 200);
vertex(400, 100);
endShape();  // stop recording the shape WITHOUT the word "CLOSE"

// 4.
//  Playing with the vertices

// Creating a shape
beginShape();  // start recording the shape
//each vertice(coodinate x, coordinate y) of the shape
vertex(200, 300);
vertex(100, 400);
vertex(400, 400);
vertex(300, 300);
endShape(CLOSE);  // stop recording the shape WITHOUT the word "CLOSE"
