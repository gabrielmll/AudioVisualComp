PFont font;

void instructions (){
  
    fill(0);
    font = loadFont("04b03-25.vlw"); // Load font.
    textFont(font, 20); // Set font and size of text.
    
    // Type instructions on the screen.
    text ("INSTRUCTIONS:", 15, 30);
    text ("W = UP", 15, 60);
    text ("S = DOWN", 15, 90);
    text ("E = WAVE", 15, 120);
    
}
