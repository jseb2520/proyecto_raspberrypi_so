#include<stdio.h>
#include<wiringPi.h>
#define SOIL_PIN 6

             int main(void)
             {
             wiringPiSetupGpio();
             pinMode(SOIL_PIN,INPUT);
                        
             if(digitalRead(SOIL_PIN)==LOW)
             {
             printf("%d",digitalRead(SOIL_PIN));
             printf("\n");
             }
             else
             {
             printf("%d",digitalRead(SOIL_PIN));
             printf("\n");
             }
             delay(5000);
             
             return 0;
             }
