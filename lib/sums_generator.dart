library mathfacts.sums_generator;

import 'dart:math';
import 'fact_enumerable.dart';
import 'fact_enumerator.dart';
import 'binary_operands.dart';

class SumsGenerator implements FactEnumerable { 
  
  final List<BinaryOperands> _facts = new List<BinaryOperands>();
  String _title;
  
  SumsGenerator(int lowerBound, int upperBound) : _title = "Sums from ${lowerBound} to ${upperBound}" {
    for (int left = 1; left <= 9; ++left) {
      int startingRight = max(lowerBound - left, 1);
      int endingRight = min(upperBound - left, 9);
      
      for (int right = startingRight; right <= endingRight; ++right)
        _facts.add(new BinaryOperands(left, right));
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