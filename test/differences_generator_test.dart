import 'package:unittest/unittest.dart';
import 'package:mathfacts/differences_generator.dart';
import 'fact_test_utilities.dart';

main() {
  test("Returns a correct title for the lower and upper bounds 0 and 10", () {
    var generator = new DifferencesGenerator(0, 10);
    expect(generator.title, equals("Differences from 0 to 10"));
  });
  
  test("Returns the correct number of facts for the lower and upper bounds 0 and 10", () {
    var generator = new DifferencesGenerator(0, 10);
    expect(generator.getEnumerator().count, equals(66));
  });
  
  test("Each difference is between the lower and upper bounds 0 and 10", () {
    verifyAllDifferencesAreInRange(0, 10, new DifferencesGenerator(0, 10).getEnumerator());
  });
  
  test("Calling next one more time than count returns a value with a valid difference", () {
    var enumerator = new DifferencesGenerator(0, 10).getEnumerator();
    for (var i = 0; i < enumerator.count; ++i)
      enumerator.next();
    var wrappedOperands = enumerator.next();
    expect(wrappedOperands.left - wrappedOperands.right, inInclusiveRange(0, 10));
  });
  
  test("There are no repeated operand pairs for the lower and upper bounds 0 and 10", () {
    verifyAllOperandPairsAreDistinct(new DifferencesGenerator(0, 10).getEnumerator());
  });
}
