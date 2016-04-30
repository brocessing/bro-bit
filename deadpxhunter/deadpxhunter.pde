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
	image(bg, 0, 0);
	stroke(0);
	point(position.x, position.y);
}

void draw(){}

void mousePressed(){
	if(mouseX==position.x && mouseY==position.y){
		exit();
	}
}