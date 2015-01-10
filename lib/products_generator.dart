library mathfacts.products_generator;

import 'dart:math';
import 'fact_enumerable.dart';
import 'fact_enumerator.dart';
import 'binary_operands.dart';

class ProductsGenerator implements FactEnumerable { 
  
  final List<BinaryOperands> _facts = new List<BinaryOperands>();
  String _title;
  
  ProductsGenerator(int lowerBound, int upperBound) {
    _title = "Products from ${lowerBound} to ${upperBound}";
    
    for (int left = 1; left <= 9; ++left) {    
      for (int right = 1; right <= 9; ++right) {
        int product = left * right;
        if (product >= lowerBound && product <= upperBound)
          _facts.add(new BinaryOperands(left, right));
      }
    }

    _facts.shuffle(new Random());
  }
  
  FactEnumerator getEnumerator() {
    return new FactEnumerator(_facts);
  }
  
  String get title {
    return _title;
  }
}