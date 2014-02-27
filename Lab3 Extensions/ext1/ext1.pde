/*
  LAB 3
  Extension 1
  
  Three waves are shown on the screen.
    You can control 2 of them with "qwer" and "asdf" from your keyboard.
    The third wave is a sum of the 2 frists 
 */

int amp1 = 30;
float freq1 = 0.05;

int amp2 = 60;
float freq2 = 0.1;

void setup() {
  size(800, 700);
}

void draw() {
  background(255);
  textSize(12);
  fill(0);
  text("Wave1 (Amp: "+amp1+", Freq: "+freq1+") Constrol keys: 'a's'd'f'", 10, 15);
  text("Wave2 (Amp: "+amp2+", Freq: "+freq2+") Constrol keys: 'q'w'e'r'", 10, 245);

  translate(0, 0.5*height/3);  // translate Y coordinate to 1/3
  drawSinF1();
  translate(0, height/3);  // translate Y coordinate to 1/3
  drawSinF2();
  translate(0, height/3 - 30);  // translate Y coordinate to 1/3 - 30
  drawSum();
}

// Draw a sin wave on horizontal vertice
void drawSinF1() {
  for (int i = 0; i <= width; i++) {
    line(i, Y(i * freq1, amp1), i+1, Y((i+1) * freq1, amp1));
  }
}

// Draw a sin wave on horizontal vertice
void drawSinF2() {
  for (int i = 0; i <= width; i++) {
    line(i, Y(i * freq2, amp2), i+1, Y((i+1) * freq2, amp2));
  }
}

// Draw the summed waves
void drawSum() {
  for (int i = 0; i <= width; i++) {
    line(i, (Y((i*freq2), amp2) + Y((i*freq1), amp1)), 
    i+1, (Y((i+1)*freq2, amp2) + Y((i+1)*freq1, amp1)));
  }
}

// Draw a Sin function for Y coordinate
float Y(float ang, int amplitude) {
  return amplitude * sin(ang);
}

// Change waves parameters
void keyPressed() {
  // change wave 1 values
  if (key == 'a') {
    if (amp1 <= 70)
      amp1++;
  }
  else if (key == 's') {
    if (amp1 > 0)
      amp1--;
  }
  else if (key == 'd') {
    freq1+=0.01;
  }
  else if (key == 'f') {
    freq1-=0.01;
  }

  // change wave 2 values
  else if (key == 'q') {
    if (amp2 <= 70)
      amp2++;
  }
  else if (key == 'w') {
    if (amp2 > 0)
      amp2--;
  }
  else if (key == 'e') {
    freq2+=0.01;
  }
  else if (key == 'r') {
    freq2-=0.01;
  }
}

