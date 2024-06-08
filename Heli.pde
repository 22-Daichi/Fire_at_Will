//import processing.serial.*;

class Heli{
    
    public float x,y,rot;
    PImage img,rotor1,rotor2,rotor3;
    //Serial port;
    
    Heli(float _x,float _y,float _rot) { //,PImage _img,PImage _rotor1,PImage _rotor2,PImage _rotor3
        x = _x;
        y = _y;
        rot = _rot;
        /* img = _img;
        rotor1 = _rotor1;
        rotor2 = _rotor2;
        rotor3 = _rotor3; */
        //port = _port1;
    }
    
    void setup(String heliImageFileName,String rotor1ImageFileName,String rotor2ImageFileName,String rotor3ImageFileName) {
        img = loadImage(heliImageFileName);
        rotor1 = loadImage(rotor1ImageFileName);
        rotor2 = loadImage(rotor2ImageFileName);
        rotor3 = loadImage(rotor3ImageFileName);
    }
    
    void dis(int dx,int dy) {
        int w = 220;
        int h = 220;
        //int angle = 0;
        if (dx > 120 && x < width) {
            x += (dx - 120) * 0.05;
        } else if (dx < 90 && x > 0) {
            x -= (100 - dx) * 0.06;
        }
        if (dy > 120 && y < height - 100) {
            y += (dy - 120) * 0.05;
        } else if (dy < 90 && y > 0) {
            y -= (100 - dy) * 0.06;
        }
        /* strokeWeight(4);
        fill(96,96,96);
        rect(x-w,y,w/5,h);
        rect(x-1.5*w,y,w/5,h);
        rect(x+1.5*w,y,w/5,h);
        rect(x+w,y,w/5,h);
        fill(30, 150, 20);
        beginShape();
        vertex(x-2*w, y-h/4);
        vertex(x+w*2, y-h/4);
        vertex(x+w*2, y+h/4);
        vertex(x, y+h*0.4);
        vertex(x-w*2, y+h/4);
        endShape(CLOSE);
        rect(x, y, w, h);
        quad(x+w/2, y-h/2, x+w/4, y-1.2*h, x-w/4, y-1.2*h, x-w/2, y-h/2);
        triangle(x+w/3, y+h/2, x, y+2*h, x-w/3, y+h/2);
        rect(x,y+(4/3)*h,0.6*w,h/5);
        fill(192,192,192);
        arc(x, y-0.5*h, 0.8*w, 0.8*w, PI, TWO_PI);
        strokeWeight(13);
        stroke(0, 0, 0);
        line(1.5*w+x, 1.5*w+y,-1.5*w+x, -1.5*w+y);
        line(1.5*w+x, -1.5*w+y,-1.5*w+x, 1.5*w+y);
        fill(0,0,0);
        ellipse(x,y,18,18); */
        image(img,x - w / 2,y,w,h);
        if (rot < 2) {
            image(rotor1,x - w / 2,y,w,h);
        } else if (rot < 4) {
            image(rotor2,x - w / 2,y,w,h);
        } else{
            image(rotor3,x - w / 2,y,w,h);
        }
        if (rot == 6) {
            rot = 0;
        } else{
            rot += 1;
        }
    }
}