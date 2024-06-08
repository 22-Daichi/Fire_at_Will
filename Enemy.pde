class Enemy{
    float ex,ey,elife,ecount;
    PImage ene;
    
    /* Enemy(float _ex,float _ey,float _elife,float _ecount){
    ex = _ex;
    ey = _ey;
    elife = _elife;
    ecount = _ecount;
} */
    Enemy(float _ex,float _ey,float _elife,float _ecount) {
        ex = _ex;
        ey = _ey;
        elife = _elife;
        ecount = _ecount;
    }
    
    void dis() {
        if (elife > 0) {
            strokeWeight(2);
            fill(255,0,0);
            triangle(ex,ey + 50,ex + 20,ey - 20,ex - 20,ey - 20);
            //image(ene,ex-25,ey-25,50,50);
        }
        if (elife <= 0) {
            elife = 0;
        }
    }
}