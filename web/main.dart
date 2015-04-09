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
  var config = JSON.decode(querySelector("#config").innerHtml);
  var type = config['type'];
  int lowerBound = int.parse(config['lowerBound']);
  int upperBound = int.parse(config['upperBound']);
  
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
  else {
    operator = '+';
    generator = new SumsGenerator(lowerBound, upperBound);
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