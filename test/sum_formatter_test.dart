import 'package:unittest/unittest.dart';
import 'package:mathfacts/sum_formatter.dart';
import 'package:mathfacts/binary_operands.dart';

main() {
  test("Returns the LaTeX string with the provided operands", () {
    var formatter = new SumFormatter();
    expect(formatter.format(new BinaryOperands(2, 3)), equals(r"\begin{array}{cc} & 2 \\ + & 3 \\ \hline \\ \end{array}"));
  });
}