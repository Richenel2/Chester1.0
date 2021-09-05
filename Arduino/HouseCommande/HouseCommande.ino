#include <dht11.h>
#include <Servo.h>

Servo myservo1; 
Servo myservo2; 
#define DHT11PIN 5 
dht11 DHT11;
int ledI=12;
int fan=13;
void setup()
{
  
  myservo1.attach(9);
  myservo2.attach(4);
  Serial.begin(9600);
  Serial.println();
  pinMode(ledI,OUTPUT);
  pinMode(fan,OUTPUT);
  
}
 
void loop()
{
  delay(500);
  if(Serial.available()){
    String t = Serial.readString();
    if (t=="a"){
      digitalWrite(ledI,HIGH);
    }else if(t=="A"){
      digitalWrite(ledI,LOW);
    }else if (t=="b"){
      digitalWrite(fan,HIGH);
    }else if(t=="B"){
      digitalWrite(fan,LOW);
    }else if (t=="c"){
      fenetre('b');
    }else if(t=="C"){
      fenetre('a');
    }else if (t=="d"){
      porte('a');
    }else if(t=="D"){
      porte('b');
    }else if (t=="e"){
      verouille('a');
    }else if(t=="E"){
      verouille('b');
    }else if (t=="f"){
      temperatureEtHumidite();
    }
  }
}
void porte(char a){
  int pos;
  if (a=='a'){
    for (pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
      myservo2.write(pos);              // tell servo to go to position in variable 'pos'
      delay(15);                       // waits 15ms for the servo to reach the position
    }
  }else{
    for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
      // in steps of 1 degree
      myservo2.write(pos);              // tell servo to go to position in variable 'pos'
      delay(15);                       // waits 15ms for the servo to reach the position
    }
  }
}
void fenetre(char a){
  int pos;
  if (a=='a'){
    for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
      // in steps of 1 degree
      myservo1.write(pos);              // tell servo to go to position in variable 'pos'
      delay(15);                       // waits 15ms for the servo to reach the position
    }
  }else{
    for (pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
      myservo1.write(pos);              // tell servo to go to position in variable 'pos'
      delay(15);                       // waits 15ms for the servo to reach the position
    }
  }
}
void temperatureEtHumidite(){
  
  DHT11.read(DHT11PIN);
  Serial.print((String)DHT11.humidity+" "+(String)DHT11.temperature);
}

void verouille( char a){
  fenetre(a);
  porte(a);
}
