Car[] cars = new Car[200];

void setup() {
  size(1000, 1000);
  for(int i=0; i<cars.length; i++){
    cars[i] = new Car(color(random(255),random(255),random(255)), random(1,5));
  }
}

void draw() {
  background(255);
  for(int i=0; i<cars.length; i++){
    cars[i].display();
    cars[i].drive();
  }

}
