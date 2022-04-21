void main(){
  print(2.sqr(2));
}

extension Sqr on num{
  num sqr(num rootDegree) {
    num eps = 0.00001; //допустимая погрешность
    num number = this;
    num root = number / rootDegree; //начальное приближение корня
    num rn = number; //значение корня последовательным делением
    while ((root > rn ? root - rn : rn - root) >= eps) {
      rn = number;
      for (int i = 1; i < rootDegree; i++) {
        rn = rn / root;
      }
      root = 0.5 * (rn + root);
    }
    return root;
  }
}

