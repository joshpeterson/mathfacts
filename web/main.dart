import 'dart:html';
import 'dart:convert';
import 'package:mathfacts/fact_formatter.dart';
import 'package:mathfacts/sums_generator.dart';

void main() {
  var config = JSON.decode(querySelector("#config").innerHtml);
  int lowerBound = int.parse(config['lowerBound']);
  int upperBound = int.parse(config['upperBound']);
  
  var formatter = new FactFormatter("+");
  var generator = new SumsGenerator(lowerBound, upperBound);
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