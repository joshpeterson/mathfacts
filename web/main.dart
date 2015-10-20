import 'dart:html';
import 'dart:convert';
import 'package:mathfacts/fact_formatter.dart';
import 'package:mathfacts/sums_generator.dart';
import 'package:mathfacts/products_generator.dart';
import 'package:mathfacts/differences_generator.dart';
import 'package:mathfacts/binary_operands.dart';

bool OperandsAreOneApart(BinaryOperands operand) {
    return (operand.left - operand.right).abs() == 1;
}

bool OperandsAreTheSame(BinaryOperands operand) {
    return operand.left == operand.right;
}

void main() {

  var type = Uri.base.queryParameters['type'];
  int lowerBound = int.parse(Uri.base.queryParameters['lowerBound']);
  int upperBound = int.parse(Uri.base.queryParameters['upperBound']);
  
  if (lowerBound >= upperBound)
    throw new ArgumentError('The lower bound must be less than or equal to the upper bound, please try again.');
  
  String operator;
  var generator;
  
  if (type == 'differences') {
    operator = '-';
    generator = new DifferencesGenerator(lowerBound, upperBound);
  }
  else if (type == 'products') {
    operator = '\\times';
    generator = new ProductsGenerator(lowerBound, upperBound);
  }
  else if (type == 'sumsOneApart') {
      operator = '+';
      generator = new SumsGenerator(lowerBound, upperBound, OperandsAreOneApart);
  }
  else if (type == 'sumsDoubles') {
      operator = '+';
      generator = new SumsGenerator(lowerBound, upperBound, OperandsAreTheSame);
  }
  else if (type == 'sums') {
    operator = '+';
    generator = new SumsGenerator(lowerBound, upperBound);
  }
  else {
    throw new ArgumentError('The type provided does not work, please try again.');
  }
  
  var formatter = new FactFormatter(operator);
  
  var enumerator = generator.getEnumerator();
  
  var titleText = 'Math Facts: ${generator.title}';
  
  var title = querySelector('#title');
  title.text = titleText;
  
  var header = querySelector('#header');
  header.text = titleText;
  
  var factsTable = querySelector('#factsTable');
  for (int row = 0; row < 5; ++row) {
    var factsRow = new Element.tag('tr');
    for (int column = 0; column < 10; ++column) {
      var fact = new Element.tag('td');
      fact.text = formatter.format(enumerator.next());
      factsRow.children.add(fact);
    }
    factsTable.children.add(factsRow);
  }
}