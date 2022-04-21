import 'dart:math';

class Point {
  int _x;
  int _y;
  int _z;

  Point(this._x, this._y, this._z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.unitVector() {
    return Point(1, 1, 1);
  }

  static double triangleArea(Point point1, Point point2, Point point3) {
    double a = point1.distanceTo(point2);
    double b = point1.distanceTo(point3);
    double c = point2.distanceTo(point3);
    double p = (a + b + c) / 2;
    return sqrt(p * (p - a) * (p - b) * (p - c));
  }

  double distanceTo(Point another) {
    var dx = _x - another._x;
    var dy = _y - another._y;
    var dz = _z - another._z;
    return sqrt(dx * dx + dy * dy + dz * dz);
  }
}
