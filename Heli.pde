//import processing.serial.*;

class Heli{
    
    public float x,y,rot;
    PImage img,rotor1,rotor2,rotor3;
    //Serial port;
    
    Heli(float _x,float _y,float _rot) {
        x = _x;
        y = _y;
        rot = _rot;
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