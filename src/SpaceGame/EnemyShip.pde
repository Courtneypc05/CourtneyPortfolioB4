class EnemyShip {
  // member variable
  int x, y, health;
  char displayMode;

  // constructor
  EnemyShip() {
    x = 0;
    y = 0;
    health = 100;
    displayMode = '1';
  }

  // member methods
  void display(int x, int y) {
    if (displayMode == '1') {
      // TODO: create enemy graphic
    }
  }
}
