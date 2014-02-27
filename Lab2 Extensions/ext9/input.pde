void keyPressed () {

  if (!wave) { // If not waving arms, control by input.

    angleChange = 5; // Sets angleCahnge to positive again.

    if (armAngle < ANGLE_LIMIT) { // If ccurrent angle is less then limit.

      if ( key == 'w' || key == 'W') { // Increment when W is pressed.
        armAngle += angleChange; // Increment the angle of rotation.
      }
      
    }

    if (armAngle > 0) {

      if ( key == 's' || key == 'S') { // Decrease when S is pressed.
        armAngle -= angleChange; // Decrease the angle of rotation.
      }
    }
  }

  if ( key == 'e' || key == 'E') { // Switch waving mode on or off when E is pressed.
    wave = !wave; // Swap waving mode.
  }
}
