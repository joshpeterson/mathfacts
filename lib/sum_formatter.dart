library mathfacts.sum_formatter;

import 'binary_operands.dart';

class SumFormatter {
  String format(BinaryOperands operands) {
    return "\\begin{array}{cc} & ${operands.left} \\\\ + & ${operands.right} \\\\ \\hline \\\\ \\end{array}";
  }
}