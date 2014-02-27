PFont font;

void instructions (){
  
    fill(255);
    font = loadFont("Verdana-Bold-14.vlw"); // Load font.
    textFont(font, 14); // Set font and size of text.
    
    // Type instructions on the screen.
    text ("INSTRUCTIONS:", 15, 50);
    text ("M + letter = more colour to channel", 160, 20);
    text ("L + letter = less colour to channel", 160, 40);
    text ("letters: R, G, B", 160, 60);
    text ("S = resets image", 160, 80);
    
}
