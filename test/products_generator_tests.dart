import 'package:unittest/unittest.dart';
import 'package:mathfacts/products_generator.dart';
import 'fact_test_utilities.dart';

main() {
  test("Returns the correct number of facts for the lower and upper bounds 1 and 81", () {
    var generator = new ProductsGenerator(1, 81);
    expect(generator.getEnumerator().count, equals(81));
  });
  
  test("Each sum is between the lower and upper bounds 1 and 81", () {
    verifyAllProductsAreInRange(1, 81, new ProductsGenerator(1, 81).getEnumerator());
  });
  
  test("Each left operand is positive for the lower and upper bounds 1 and 81", () {
    verifyAllLeftOperandsPositive(new ProductsGenerator(1, 81).getEnumerator());
  });
  
  test("Each right operand is positive for the lower and upper bounds 1 and 81", () {
    verifyAllRightOperandsPositive(new ProductsGenerator(1, 81).getEnumerator());
  });
  
  test("There are no repeated operand pairs for the lower and upper bounds 1 and 81", () {
    verifyAllOperandPairsAreDistinct(new ProductsGenerator(1, 81).getEnumerator());
  });
  
  test("Returns a correct title for the lower and upper bounds 1 and 81", () {
    var generator = new ProductsGenerator(1, 81);
    expect(generator.title, equals("Products from 1 to 81"));
  });
  
  test("Calling next one more time than count returns a value with a valid sum", () {
    var enumerator = new ProductsGenerator(1, 81).getEnumerator();
    for (int i = 0; i < enumerator.count; ++i)
      enumerator.next();
    var wrappedOperands = enumerator.next();
    expect(wrappedOperands.left + wrappedOperands.right, inInclusiveRange(1, 81));
  });
}
