void main(){
 print(integrate(func, -2, 6, 0.001));
}

double func(double x){
  return x*x*x - 2*x*x + 1;
}


double integrate(Function f, double a, double b, double eps){
  double sum = 0;
  double lastIntegral = double.infinity;
  double delta = 1;
  double step = 1;
  while(delta >= eps){
    for(double i = a; i < b; i += step){
      try{
        sum += f(i);
      }catch(e){
        continue;
      }
    }

    sum *= step;
    delta = (lastIntegral - sum).abs();
    lastIntegral = sum;
    sum = 0;
    step /= 10;
  }
  return lastIntegral;
}