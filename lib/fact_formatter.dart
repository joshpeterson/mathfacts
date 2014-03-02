library mathfacts.sum_formatter;

import 'binary_operands.dart';

class FactFormatter {
  final String _operator;
  
  FactFormatter(this._operator);
  
  String format(BinaryOperands operands) {
    return "\\begin{array}{cc} & ${operands.left} \\\\ ${_operator} & ${operands.right} \\\\ \\hline \\\\ \\end{array}";
  }
}