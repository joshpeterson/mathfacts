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
}