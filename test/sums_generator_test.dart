import 'package:unittest/unittest.dart';
import 'package:mathfacts/sums_generator.dart';
import 'fact_test_utilities.dart';
import 'package:mathfacts/binary_operands.dart';

main() {
  test("Returns the correct number of facts for the lower and upper bounds 10 and 18", () {
    var generator = new SumsGenerator(10, 18);
    expect(generator.getEnumerator().count, equals(45));
  });
  
  test("Each sum is between the lower and upper bounds 10 and 18", () {
    verifyAllSumsAreInRange(10, 18, new SumsGenerator(10, 18).getEnumerator());
  });
  
  test("Each left operand is positive for the lower and upper bounds 10 and 18", () {
    verifyAllLeftOperandsPositive(new SumsGenerator(10, 18).getEnumerator());
  });
  
  test("Each right operand is positive for the lower and upper bounds 10 and 18", () {
    verifyAllRightOperandsPositive(new SumsGenerator(10, 18).getEnumerator());
  });
  
  test("There are no repeated operand pairs for the lower and upper bounds 10 and 18", () {
    verifyAllOperandPairsAreDistinct(new SumsGenerator(10, 18).getEnumerator());
  });
  
  test("Returns a correct title for the lower and upper bounds 10 and 18", () {
    var generator = new SumsGenerator(10, 18);
    expect(generator.title, equals("Sums from 10 to 18"));
  });
  
  test("Returns the correct number of facts for the lower and upper bounds 1 and 10", () {
    var generator = new SumsGenerator(1, 10);
    expect(generator.getEnumerator().count, equals(45));
  });
  
  test("Each sum is between the lower and upper bounds 1 and 10", () {
    verifyAllSumsAreInRange(1, 10, new SumsGenerator(1, 10).getEnumerator());
  });
  
  test("Each left operand is positive for the lower and upper bounds 1 and 10", () {
    verifyAllLeftOperandsPositive(new SumsGenerator(1, 10).getEnumerator());
  });
  
  test("Each right operand is positive for the lower and upper bounds 1 and 10", () {
    verifyAllRightOperandsPositive(new SumsGenerator(1, 10).getEnumerator());
  });
  
  test("There are no repeated operand pairs for the lower and upper bounds 1 and 10", () {
    verifyAllOperandPairsAreDistinct(new SumsGenerator(1, 10).getEnumerator());
  });
  
  test("Returns a correct title for the lower and upper bounds 1 and 10", () {
    var generator = new SumsGenerator(1, 10);
    expect(generator.title, equals("Sums from 1 to 10"));
  });
  
  test("Calling next one more time than count returns a value with a valid sum", () {
    var enumerator = new SumsGenerator(10, 18).getEnumerator();
    for (int i = 0; i < enumerator.count; ++i)
      enumerator.next();
    var wrappedOperands = enumerator.next();
    expect(wrappedOperands.left + wrappedOperands.right, inInclusiveRange(10, 18));
  });
  
  bool OneOperandIsOne(BinaryOperands operand) {
    return operand.left == 1 || operand.right == 1;
  }
  
  test("A predicate can be used to filter operand pairs.", () {
    var generator = new SumsGenerator(1, 10, OneOperandIsOne);
    expect(generator.getEnumerator().count, equals(17));
  });
}
