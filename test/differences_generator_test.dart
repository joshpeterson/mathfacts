import 'package:unittest/unittest.dart';
import 'package:mathfacts/differences_generator.dart';

main() {
  test("Returns a correct title for the lower and upper bounds 0 and 10", () {
    var generator = new DifferencesGenerator(0, 10);
    expect(generator.title, equals("Differences from 0 to 10"));
  });
  
  test("Returns the correct number of facts for the lower and upper bounds 0 and 10", () {
    var generator = new DifferencesGenerator(0, 10);
    expect(generator.count, equals(66));
  });
  
  test("Each difference is between the lower and upper bounds 0 and 10", () {
    VerifyAllDifferencesAreInRange(0, 10);
  });
  
  test("Calling next one more time than count returns a value with a valid difference", () {
    var generator = new DifferencesGenerator(0, 10);
    for (int i = 0; i < generator.count; ++i)
      generator.next();
    var wrappedOperands = generator.next();
    expect(wrappedOperands.left - wrappedOperands.right, inInclusiveRange(0, 10));
  });
  
  test("There are no repeated operand pairs for the lower and upper bounds 0 and 10", () {
    VerifyAllOperandPairsAreDistinct(0, 10);
  });
}

void VerifyAllDifferencesAreInRange(int lowerBound, int upperBound) {
  var generator = new DifferencesGenerator(lowerBound, upperBound);
  for (int i = 0; i < generator.count; ++i) {
    var operands = generator.next();
    expect(operands.left - operands.right, inInclusiveRange(lowerBound, upperBound));
  }
}

void VerifyAllOperandPairsAreDistinct(int lowerBound, int upperBound) {
  var allOperandsSet = new Set();
  var generator = new DifferencesGenerator(lowerBound, upperBound);
  for (int i = 0; i < generator.count; ++i) {
    var operands = generator.next();
    expect(allOperandsSet.add(operands), isTrue, reason:'${operands} was generated twice');
  }
}
