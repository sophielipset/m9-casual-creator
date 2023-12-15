// Variables for user to interact with 
int num_divisions = 2;
int fill_color = 125;
int num_image = 1; 

void setup() {
  size(1400, 650);
  
  // Directions
  textSize(50);
  text("Drag the mouse to draw!", 40, 100); 
  textSize(30);
  text("To increase the number of symmetries, click the RIGHT key.", 40, 160);
  text("To decrease them, click the LEFT key.", 40, 200);
  text("To change the color, click the UP or DOWN keys.", 40, 240);
  
  fill(fill_color, 50, 200);

}

void draw() {
}

void mouseDragged(){
  float r;
  float theta; 
  float angle_dif;
  
  // Calculate x and y distances from (325,325), origin
  float x_dist = mouseX - 700; 
  float y_dist = mouseY - 325;
  
  // Find hypotenuse of right triangle with x_dist and y_dist legs
  r = sqrt((x_dist * x_dist) + (y_dist * y_dist)); 
  
  // Calculate angle between x-axis and r 
  theta = atan2(y_dist, x_dist); 
  
  // Using num_divisions, get angle different 
  angle_dif = TWO_PI / num_divisions; 
  if (theta < 0) {
    angle_dif = -1 * angle_dif;
  }
    
  float new_theta, new_x, new_y;
  
  // Draw num_divisions different circles, equally spaced apart with angles
  for (int i = 0; i < num_divisions; i = i+1) {
    new_theta = theta + (i * angle_dif);
    new_x = r * cos(new_theta) + 700;
    new_y = r * sin(new_theta) + 325; 
    circle(new_x, new_y, r);
  }
}

void keyPressed() {
  if (keyCode == LEFT && num_divisions > 1) {
    // Decrease number of symmetries/divisions
    num_divisions -= 1;
  } else if (keyCode == RIGHT) {
    // Increase number of symmetries/divisions
    num_divisions += 1;
  } else if (keyCode == UP && fill_color < 255) {
    // Lighten color when drawing
    fill_color += 25;
    fill(fill_color, 50, 200);
  } else if (keyCode == DOWN && fill_color >= 25) {
    // Darken color when drawing 
    fill_color -= 25; 
    fill(fill_color, 50, 200);  
  } else if (keyCode == ENTER) { 
    saveFrame("slipset/Desktop/symmetries-######.png");
  }
}
