class Hater
{
  PVector location;
  float size;
  color body_color;
  
  float noise_x, noise_y, noise_z;
  
  Hater(float x, float y, float z)
  {
    location = new PVector(x, y, z);
    size = 10;
    body_color = color(255);
    
    noise_x = random(10);
    noise_y = random(10);
    noise_z = random(10);
  }
  
  void update()
  {
    float x = map(noise(noise_x), 0, 1, 0, width);
    float y = map(noise(noise_y), 0, 1, 0, height);
    float z = map(noise(noise_z), 0, 1, -height / 2, height / 2);
    
    location = new PVector(x, y, z);
    
    noise_x += 0.025;
    noise_y += 0.025;
    noise_z += 0.025;
  }
 
  void display()
  {    
    pushMatrix();
    translate(location.x, location.y, location.z);
    
    noStroke();
    fill(body_color);
    sphere(size);
    
    popMatrix();
  }
}