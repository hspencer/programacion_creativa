var s, x, y;

function setup() {
	createCanvas(500, 500);
	mouseX = mouseY = 250;
	background(0);
	s = 255;
}

function draw() {
	x = cos((mouseX - pmouseX)/333.33) * 50.0;
	y = sin((mouseY - pmouseY)/333.33) * 50.0;
	
	print("x = "+x+"        y =" + y);
	stroke(s, 25);
	

	if(mouseIsPressed) line(mouseX, mouseY, width/2,height/2);
	if (s < 0) s = 255;
	
}