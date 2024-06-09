class Weapon{
    float wx,wy,wlife,tgtx,tgty;
    
    Weapon(float _wx,float _wy,float _wlife,float _tgtx,float _tgty) {
        wx = _wx;
        wy = _wy;
        wlife = _wlife;
        tgtx = _tgtx;
        tgty = _tgty;//追加した。
    }
    
    void openFire(float x,float y) {
        wx = x;
        wy = y;
        wlife = 1;
    }
    
    
    void dis() {
        float ang;
        /* if(abs(wx - tgtx) == 0){
        ang = PI/2;
    }else{
        ang = atan((wy - tgty)/abs(wx - tgtx));
    } */
        ang = PI / 2;
        if (wlife ==  1 && wy > 0) {
            wy -= 10 * sin(ang);
            wx -= 10 * ((wx - tgtx) / (abs(wx - tgtx))) * cos(ang);
            strokeWeight(1);
            fill(234,0,0);
            ellipse(wx,wy - 10,10,10);
        }
        if (wlife == 0) {
            wx = 0;
            wy = 0;
        }
    }
}