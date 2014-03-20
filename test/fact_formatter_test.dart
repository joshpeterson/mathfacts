import 'package:unittest/unittest.dart';
import 'package:mathfacts/fact_formatter.dart';
import 'package:mathfacts/binary_operands.dart';

main() {
  test("Returns the LaTeX string with the provided operands for a sum", () {
    var formatter = new FactFormatter("+");
    expect(formatter.format(new BinaryOperands(2, 3)), equals(r"\begin{array}{cr} & 2 \\ + & 3 \\ \hline \\ \end{array}"));
  });
  
  test("Returns the LaTeX string with the provided operands for a difference", () {
    var formatter = new FactFormatter("-");
    expect(formatter.format(new BinaryOperands(2, 3)), equals(r"\begin{array}{cr} & 2 \\ - & 3 \\ \hline \\ \end{array}"));
  });
  
  test("Returns the LaTeX string with the provided operands when the left operand is two digits", () {
      var formatter = new FactFormatter("+");
      expect(formatter.format(new BinaryOperands(10, 9)), equals(r"\begin{array}{r} 10 \\ + 9 \\ \hline \\ \end{array}"));
  });
  
  test("Returns the LaTeX string with the provided operands when the right operand is two digits", () {
        var formatter = new FactFormatter("+");
        expect(formatter.format(new BinaryOperands(9, 12)), equals(r"\begin{array}{r} 9 \\ + 12 \\ \hline \\ \end{array}"));
  });
}