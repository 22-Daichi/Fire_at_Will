class Missle{
    float mx,my,mlife;
    
    Missle(float _mx,float _my,float _mlife) {
        mx = _mx;
        my = _my;
        mlife = _mlife;
    }
    
    void openFire(float x,float y) {
        mx = x;
        my = y;
        mlife = 1;
    }
    
    void dis() {
        if (mlife == 1 && my > 0) {
            my -= 8;
            strokeWeight(2);
            fill(255,0,0);
            ellipse(mx,my + 20,20,20);
            fill(255,255,0);
            ellipse(mx,my + 20,10,10);
            fill(0,0,0);
            rect(mx,my,10,40,5);
        }
        if (mlife == 0) {
            mx = 0;
            my = 0;
        }
    }
}