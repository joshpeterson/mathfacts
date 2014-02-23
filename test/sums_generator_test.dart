import 'package:unittest/unittest.dart';
import 'package:mathfacts/sums_generator.dart';

main() {
  test("Returns the correct number of facts for the lower and upper bounds 10 and 18", () {
    var generator = new SumsGenerator(10, 18);
    expect(generator.count, equals(45));
  });
  
  test("Each sum is between the lower and upper bounds 10 and 18", () {
    VerifyAllSumsAreInRange(10, 18);
  });
  
  test("Each left operand is positive for the lower and upper bounds 10 and 18", () {
    VerifyAllLeftOperandsPositive(10, 18);
  });
  
  test("Each right operand is positive for the lower and upper bounds 10 and 18", () {
    VerifyAllRightOperandsPositive(10, 18);
  });
  
  test("There are no repeated operand pairs for the lower and upper bounds 10 and 18", () {
    VerifyAllOperandPairsAreDistinct(10, 18);
  });
  
  test("Returns a correct title for the lower and upper bounds 10 and 18", () {
    var generator = new SumsGenerator(10, 18);
    expect(generator.title, equals("Sums from 10 to 18"));
  });
  
  test("Returns the correct number of facts for the lower and upper bounds 1 and 10", () {
    var generator = new SumsGenerator(1, 10);
    expect(generator.count, equals(45));
  });
  
  test("Each sum is between the lower and upper bounds 1 and 10", () {
    VerifyAllSumsAreInRange(1, 10);
  });
  
  test("Each left operand is positive for the lower and upper bounds 1 and 10", () {
    VerifyAllLeftOperandsPositive(1, 10);
  });
  
  test("Each right operand is positive for the lower and upper bounds 1 and 10", () {
    VerifyAllRightOperandsPositive(1, 10);
  });
  
  test("There are no repeated operand pairs for the lower and upper bounds 1 and 10", () {
    VerifyAllOperandPairsAreDistinct(1, 10);
  });
  
  test("Returns a correct title for the lower and upper bounds 1 and 10", () {
    var generator = new SumsGenerator(1, 10);
    expect(generator.title, equals("Sums from 1 to 10"));
  });
  
  test("Calling next one more time than count returns a value with a valid sum", () {
    var generator = new SumsGenerator(10, 18);
    for (int i = 0; i < generator.count; ++i)
      generator.next();
    var wrappedOperands = generator.next();
    expect(wrappedOperands.left + wrappedOperands.right, inInclusiveRange(10, 18));
  });
}

void VerifyAllSumsAreInRange(int lowerBound, int upperBound) {
  var generator = new SumsGenerator(lowerBound, upperBound);
  for (int i = 0; i < generator.count; ++i) {
    var operands = generator.next();
    expect(operands.left + operands.right, inInclusiveRange(lowerBound, upperBound));
  }
}

void VerifyAllLeftOperandsPositive(int lowerBound, int upperBound) {
  var generator = new SumsGenerator(lowerBound, upperBound);
  for (int i = 0; i < generator.count; ++i) {
    var operands = generator.next();
    expect(operands.left, isPositive);
  }
}

void VerifyAllRightOperandsPositive(int lowerBound, int upperBound) {
  var generator = new SumsGenerator(lowerBound, upperBound);
  for (int i = 0; i < generator.count; ++i) {
    var operands = generator.next();
    expect(operands.right, isPositive);
  }
}

void VerifyAllOperandPairsAreDistinct(int lowerBound, int upperBound) {
  var allOperandsSet = new Set();
  var generator = new SumsGenerator(lowerBound, upperBound);
  for (int i = 0; i < generator.count; ++i) {
    var operands = generator.next();
    expect(allOperandsSet.add(operands), isTrue, reason:'${operands} was generated twice');
  }
}
