import java.awt.*;
Robot robot;
PImage bg;
PVector position;

void settings(){
	robot = null;
	try{robot = new Robot();}
	catch(AWTException e){println("Oops: " + e);}
	bg = new PImage((java.awt.image.BufferedImage) robot.createScreenCapture(new Rectangle(0, 0, displayWidth, displayHeight)));
	fullScreen();
	pixelDensity(displayDensity());
}

void setup() {
	position = new PVector(int(random(width)), int(random(height)));
	bg.loadPixels();
		int id = int(position.y*width+position.x);
		bg.pixels[id] = color(((brightness(bg.pixels[id])>127)?0:255));
	bg.updatePixels();
	image(bg, 0, 0);

	stroke(255,0,0);
	noFill();
	rect(position.x - 10, position.y - 10, 20, 20);
}

void draw(){}

void mousePressed(){
	int dist = (int) Math.hypot(position.x-mouseX, position.y-mouseY);
	if(dist <= 5){
		exit();
	}
}
