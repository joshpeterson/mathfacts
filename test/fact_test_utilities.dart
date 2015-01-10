import 'package:unittest/unittest.dart';
import 'package:mathfacts/fact_enumerator.dart';

typedef int Binary(int left, int right); 

void verifyAllDifferencesAreInRange(int lowerBound, int upperBound, FactEnumerator enumerator) {
  verifyAllValuesAreInRange(lowerBound, upperBound, enumerator, difference);
}

void verifyAllSumsAreInRange(int lowerBound, int upperBound, FactEnumerator enumerator) {
  verifyAllValuesAreInRange(lowerBound, upperBound, enumerator, sum);
}

void verifyAllProductsAreInRange(int lowerBound, int upperBound, FactEnumerator enumerator) {
  verifyAllValuesAreInRange(lowerBound, upperBound, enumerator, product);
}

void verifyAllValuesAreInRange(int lowerBound, int upperBound, FactEnumerator enumerator, Binary operator) {
  for (int i = 0; i < enumerator.count; ++i) {
    var operands = enumerator.next();
    expect(operator(operands.left, operands.right), inInclusiveRange(lowerBound, upperBound));
  }
}

void verifyAllLeftOperandsPositive(FactEnumerator enumerator) {
  for (int i = 0; i < enumerator.count; ++i) {
    var operands = enumerator.next();
    expect(operands.left, isPositive);
  }
}

void verifyAllRightOperandsPositive(FactEnumerator enumerator) {
  for (int i = 0; i < enumerator.count; ++i) {
    var operands = enumerator.next();
    expect(operands.right, isPositive);
  }
}

void verifyAllRightOperandsAreLessThan(int upperBound, FactEnumerator enumerator) {
  for (int i = 0; i < enumerator.count; ++i) {
    var operands = enumerator.next();
    expect(operands.right, lessThan(upperBound));
  }
}

void verifyAllOperandPairsAreDistinct(FactEnumerator enumerator) {
  var allOperandsSet = new Set();
  for (int i = 0; i < enumerator.count; ++i) {
    var operands = enumerator.next();
    expect(allOperandsSet.add(operands), isTrue, reason:'${operands} was generated twice');
  }
}

int sum(int left, int right) {
  return left + right;
}

int difference(int left, int right) {
  return left - right;
}

int product(int left, int right) {
  return left * right;
}