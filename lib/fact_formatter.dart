library mathfacts.sum_formatter;

import 'binary_operands.dart';

class FactFormatter {
  final String _operator;
  
  FactFormatter(this._operator);
  
  String format(BinaryOperands operands) {
    if (operands.left > 9 || operands.right > 9)
      return "\\begin{array}{r} ${operands.left} \\\\ ${_operator} ${operands.right} \\\\ \\hline \\\\ \\end{array}";
    return "\\begin{array}{cr} & ${operands.left} \\\\ ${_operator} & ${operands.right} \\\\ \\hline \\\\ \\end{array}";
  }
}