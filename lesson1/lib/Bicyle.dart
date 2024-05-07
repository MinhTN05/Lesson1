class Bicyle {
  int cadence;
  int _speed = 0;
  int get speed => _speed;
  int gear;

  Bicyle(this.cadence, this.gear);

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() {
    return 'Bicyle: $_speed mph';
  }

// @override
// String toString() => 'Bicyle: $_speed mph';

}