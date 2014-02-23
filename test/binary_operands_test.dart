import 'package:unittest/unittest.dart';
import 'package:mathfacts/binary_operands.dart';

main() {
  test("The toString method returns the expected string", () {
    var operands = new BinaryOperands(3, 7);
    expect(operands.toString(), equals("left: 3 right: 7"));
  });
  
  test("BinaryOperand instances with the same left and right values are equal", () {
    var first = new BinaryOperands(3, 7);
    var second = new BinaryOperands(3, 7);
    expect(first == second, isTrue, reason: "The values are not equal, which is not expected.");
  });
  
  test("BinaryOperand instances with the different left values not are not equal", () {
    var first = new BinaryOperands(3, 7);
    var second = new BinaryOperands(4, 7);
    expect(first == second, isFalse, reason: "The values are equal, which is not expected.");
  });
  
  test("BinaryOperand instances with the different right values not are not equal", () {
    var first = new BinaryOperands(3, 7);
    var second = new BinaryOperands(3, 8);
    expect(first == second, isFalse, reason: "The values are equal, which is not expected.");
  });
  
  test("A BinaryOperand instance is equal to itself", () {
    var operands = new BinaryOperands(3, 7);
    expect(operands == operands, isTrue, reason: "The values are not equal, which is not expected.");
  });
}