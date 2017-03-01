
ArrayList<Particle> particles;
Hater _hater;
float _power;

float angle;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  
  particles = new ArrayList<Particle>();
  
  int span = 50;
  for(int x = 0; x < width; x += span)
  {
    for(int y = 0; y < height ; y += span)
    {
      for(int z = -height / 2; z < height / 2; z += span)
      {
        particles.add(new Particle(x, y, z));
      }
    }
  }
    
  _hater = new Hater(width / 2, height / 2, 0);
  _power = 200;
  
  angle = 0;
}

void draw()
{
  background(0);
  
  angle = (angle + 0.25) % 360;
  // float radius = (height / 2.0) / tan(PI*60.0 / 360.0);
  float radius = 800;
  float x = radius * cos(radians(angle));
  float z = radius * sin(radians(angle));
    
  camera(x + width / 2.0, height / 2.0, z, 
         width / 2.0, height / 2.0, 0.0, 
         0.0, 1.0, 0.0);
  
  _hater.update();
  _hater.display();
  
  for(Particle p : particles)
  {
    p.escape(_hater.location);
    p.update();
    p.display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}