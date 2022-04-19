import 'dart:math';

void main() {
}

List<int> primeFactors(int number) {
  List<int> primes = [];
  int divisors = sqrt(number).toInt();
  for (int i = 2; i <= divisors && number != 1; i++) {
    while (number % i == 0) {
      primes.add(i);
      number ~/= i;
    }
  }
  if (number != 1) {
    primes.add(number);
  }

  return primes;
}

bool numberInList(int number, List<int> list) {
  for (int i = 0; i < list.length && number >= list[i]; i++) {
    if (list[i] == number) {
      list.removeAt(i);
      return true;
    }
  }
  return false;
}

int NOD(int number1, int number2) {
  int result = 1;
  var primes1 = primeFactors(number1);
  var primes2 = primeFactors(number2);
  for (int number in primes1) {
    if (numberInList(number, primes2)) {
      result *= number;
    }
  }
  return result;
}

int NOK(int number1, int number2) {
  int result = 1;
  var primes1 = primeFactors(number1);
  var primes2 = primeFactors(number2);
  for (int i = 0; i < primes1.length; i++) {
    if (numberInList(primes1[i], primes2)) {
      result *= primes1[i];
      primes1.removeAt(i);
      i--;
    }
  }
  for (int i in primes1) {
    result *= i;
  }
  for (int i in primes2) {
    result *= i;
  }
  return result;
}

int toDecimalNumber(List<int> binaryNumber) {
  int result = 0;
  for (int digit in binaryNumber) {
    result <<= 1;
    result |= digit;
  }
  return result;
}

List<int> toBinaryNumber(int decimalNumber) {
  List<int> binaryNumber = [];
  while (decimalNumber != 0) {
    int digit = decimalNumber % 2;
    decimalNumber ~/= 2;
    binaryNumber.add(digit);
  }
  return binaryNumber.reversed.toList();
}

List<int?> findNumbersInString(String string) {
  List<int?> result =
      string.split(" ").map((word) => int.tryParse(word)).toList();
  result.removeWhere((element) => element == null);
  return result;
}

Map<String, int> wordOccurrencesInList(List<String> list) {
  Map<String, int> result = {};
  list = list.map((word) => word.trim().toLowerCase()).toList();
  for (String word in list) {
    if (result.containsKey(word)) {
      result[word] = result[word]! + 1;
    } else {
      result[word] = 1;
    }
  }
  return result;
}

List<int> numbersInText(String text) {
  List<int> numbers = [];
  List<String> wordNumbers = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  List<String> words =
      text.toLowerCase().replaceAll(RegExp(r"[^\w\s]+"), ' ').split(' ');
  for (String word in words) {
    for (int i = 0; i < wordNumbers.length; i++) {
      if (word == wordNumbers[i]) {
        if (!numbers.contains(i)) {
          numbers.add(i);
        }
        break;
      }
    }
  }
  return numbers;
}
