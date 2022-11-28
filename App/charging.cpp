#include "charging.h"

bool charging = false;
int charge = 100;


Charging::Charging()
{

}

int Charging::charger()
{
    if(charging==true && charge<100){

        charge++;
        return charge;
    }
    if(charging==false && charge>0){

        charge--;
        return charge;
    }
    else{

        return charge;
    }
}

bool Charging::check()
{
    if(charging==false){

        charging=true;
        return charging;
    }
    else{

        charging=false;
        return charging;
    }
}

