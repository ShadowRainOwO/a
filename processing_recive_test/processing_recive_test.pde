import mqtt.*;
MQTTClient client;
int count = 1;
int meCounter;

static final String server = "mqtt://datt3700:datt3700experiments@datt3700.cloud.shiftr.io";

void settings() {
  size(400, 400);
}

void messageReceived(String topic, byte[] payload) {
  //println(topic, int(new String(payload)));  // this is a general print of all topics subscribed to.
    
  if (topic.equals("test1/test2")){ //  if topic string is named "whatever" - then set the values received as a float. 
  meCounter = int(new String(payload));
  println("Counter/Name - " + (meCounter)); // print the values
  }
}

void setup() {
  client = new MQTTClient(this);
  client.connect(server, "Yuxuan_Wang");
  client.subscribe("test1/test2");
}

void draw() {
  background(0);
}

void keyPressed(){

  client.publish("/test1/test2", str(count));
  count++;

}
