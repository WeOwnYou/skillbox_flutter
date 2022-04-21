List<double> gauss(List<List<double>> leftPart, List<double> rightPart){
  List<List<double>> temp = [];
  for(int i = 0; i < leftPart.length;i++) {
    List<double> temp0 = [];
    for (int j = 0; j < leftPart[0].length; j++) {
      temp0.add(leftPart[i][j]);
    }
    temp0.add(rightPart[i]);
    temp.add(temp0);
  }

  for(int i = 0; i < temp.length; i++){
    double divider = 1 / temp[i][i];
    temp[i] = temp[i].multiply(divider);
    for(int j = i + 1; j < temp.length; j++){
      double factor = temp[j][i];
      temp[j] = temp[j].subtract(temp[i].multiply(factor));
    }
  }

  for(int k = temp.length - 1; k > 0; k--){
    for(int i = k - 1; i >= 0; i--){
      double factor = temp[i][k];
      temp[i] = temp[i].subtract(temp[k].multiply(factor));
    }
  }

  for(int i = 0; i < rightPart.length; i++){
    rightPart[i] = temp[i][temp.length];
  }
  return rightPart;
}

void main(){
  List<double> a = [1,2,3];
  print(a.subtract(a));
  print(gauss([[5,2,3],[6,5,31],[78,8,9]], [1,2,3]));
}

extension MathOperations on List<double>{
  List<double> subtract(List<double> right){
    List<double> result = [];
    for(int i = 0; i < right.length; i++){
      result.add(this[i] - right[i]);
    }
    return result;
  }

  List<double> multiply(double number){
    List<double> result = [];
    for(int i = 0; i < length; i++){
      result.add(this[i] * number);
    }
    return result;
  }

  List<double> divide(double number){
    List<double> result = [];
    for(int i = 0; i < length; i++){
      result.add(this[i] / number);
    }
    return result;
  }
}