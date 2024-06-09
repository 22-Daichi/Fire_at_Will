import processing.serial.*;
Serial port;

Heli p1;

int t = 0;
int weapon_num = 0; // 画面上に表示可能な最大の弾の個数
int missle_num = 0; // 画面上に表示可能な最大のミサイルの個数
int enemy_number = 10; // 敵の数
int p1x;
int p1y;
int fire_weapon1;
int fire_missle;
int restart = 1;
int score = 0;
int reloadmissle = 100;
float time = 0;
Weapon[] weapons;
Missle[] missles;
Enemy[] enemies;

void setup() {
    fullScreen();
    //size(1000,1000);
    colorMode(RGB,256);
    rectMode(CENTER);
    strokeJoin(ROUND);
    port = new Serial(this, "COM7", 9600);
    p1 = new Heli(width / 2,height - 400,0);
    p1.setup("image//heli0326.png","image//main_rotor.png","image//main_rotor02.png","image//main_rotor03.png");
    weapons = new Weapon[50];
    missles = new Missle[10];
    for (int i = 0;i < 10;i++) {
        missles[i] = new Missle(0,0,0);
    }
    for (int i = 0;i < 50;i++) {
        weapons[i] = new Weapon(0,0,0,0,0);
    }
    enemies = new Enemy[enemy_number];
    frameRate(50);
    PFont font = createFont("MS Gothic",50);
    textFont(font);
}

void top() {
    background(122, 203, 243);
    p1.x = width / 2;
    p1.y = height - 400;
    for (int i = 0;i < enemy_number;i++) {
        enemies[i] = new Enemy(int(random(20, width - 20)),int(random(50,300)),5,0,"image//kama.png");
    }
    score = 0;
    time = 0;
}

void explosion(float px,float py,int i) {
    strokeWeight(1);
    fill(255,0,0);
    ellipse(px,py,60,60);
    fill(255,255,0);
    ellipse(px,py,30,30);
    enemies[i].ex = 0;
    enemies[i].ey = 0;
    //enemies[i].elife = 0;
    enemies[i].ecount += 1;
    score += 1;
}

void draw() {
    if (restart == 1) {
        top();
    }
    if (port.available() > 0) {
        background(122, 203, 243);
        p1x = port.read();
        p1y = port.read();
        fire_weapon1 = port.read();
        fire_missle = port.read();
        restart = port.read();
        if (p1x == 0) {
            p1x = 100;
        }
        if (p1y == 0) {
            p1y = 100;
        }
        p1.dis(p1x,p1y);
        if (fire_weapon1 == 1) {
            weapons[weapon_num].wx = p1.x;
            weapons[weapon_num].wy = p1.y;
            weapons[weapon_num].wlife = 1;
            weapon_num += 1;
            if (weapon_num == 50) {
                weapon_num = 0;
            }
        }
        if (fire_missle ==  1) {
            missles[missle_num].mx = p1.x;
            missles[missle_num].my = p1.y;
            missles[missle_num].mlife = 1;
            missle_num += 1;
            reloadmissle = 0;
            if (missle_num == 10) {
                missle_num = 0;
            }
        }
        for (int i = 0;i < 50;i++) {//weapon1の当たり判定
            for (int k = 0;k < enemy_number;k ++) {
                if (abs(enemies[k].ex - weapons[i].wx)<30 && abs(enemies[k].ey - weapons[i].wy)< 25) {
                    enemies[k].elife -= 1;
                    weapons[i].wlife = 0; 
                }
            }
        }
        for (int i = 0;i < 10;i++) {//missle当たり判定
            for (int k = 0;k < enemy_number;k ++) {
                if (abs(enemies[k].ex - missles[i].mx)<30 && abs(enemies[k].ey - missles[i].my)< 25) {
                    enemies[k].elife -= 5;
                    missles[i].mlife = 0;
                }
            }
        }
        for (int i = 0;i <  50;i ++) {
            weapons[i].dis();
        }
        for (int i = 0; i < 10; i++) {
            missles[i].dis();
        }
        for (int i = 0;i < enemy_number;i++) {
            enemies[i].dis();
            if (enemies[i].elife == 0 && enemies[i].ecount == 0) {
                explosion(enemies[i].ex,enemies[i].ey,i);
            }
        }
    }
    textSize(50);
    fill(0,0,0);
    textAlign(CENTER,CENTER);
    text("スコア:",width / 2 - 225,50);
    text(score,width / 2 - 125,50);
    text("タイム:",width / 2 ,50);
    //time = (floor(time*100))/100;
    text(time,width / 2 + 175,50);
    text(p1x,width / 2 - 125,100);
    text(p1y,width / 2 + 125,100);
    if (score < enemy_number) {
        time += 0.02;
    }
    rectMode(CORNER);
    noStroke();
    textAlign(LEFT, CENTER);
    textSize(40);
    if (reloadmissle == 100) {
        fill(0,0,0);
        text("READY",width - 190,height - 75);
        fill(0,255,0);
    } else{
        fill(0,0,0);
        text("LOADING...",width - 190,height - 75);
        fill(255,0,0);
    }
    rect(width - 400,height - 100,reloadmissle * 2,50);
    stroke(0,0,0);
    strokeWeight(2);
    noFill();
    rect(width - 400,height - 100,200,50);
    rectMode(CENTER);
    if (reloadmissle < 100) {
        reloadmissle += 1;
    }
    if (port.available() > 5) {
        port.clear();
    }
}