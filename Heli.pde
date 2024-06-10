//import processing.serial.*;

class Heli{
    
    public float x,y,rot,life;
    PImage img,rotor1,rotor2,rotor3;
    //Serial port;
    
    Heli(float _x,float _y,float _rot,float _life,String heliImageFileName,String rotor1ImageFileName,String rotor2ImageFileName,String rotor3ImageFileName) {
        x = _x;
        y = _y;
        rot = _rot;
        life = _life;
        img = loadImage(heliImageFileName);
        rotor1 = loadImage(rotor1ImageFileName);
        rotor2 = loadImage(rotor2ImageFileName);
        rotor3 = loadImage(rotor3ImageFileName);
    }
    
    void dis(int dx,int dy) {
        if (dx == 0) {  // ここからはノイズ対策
            dx = 100;
        }
        if (dy == 0) {
            dy = 100;
        }
        int w = 220;
        int h = 220;
        float timesA = 0.1;// リアルスティックでは0.05
        float timesB = 0.1;// リアルスティックでは0.06
        //int angle = 0;
        if (dx > 120 && x < width) {
            x += (dx - 120) * timesA;
        } else if (dx < 90 && x > 0) {
            x -= (100 - dx) * timesB;
        }
        if (dy > 120 && y < height - 100) {
            y += (dy - 120) * timesA;
        } else if (dy < 90 && y > 0) {
            y -= (100 - dy) * timesB;
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