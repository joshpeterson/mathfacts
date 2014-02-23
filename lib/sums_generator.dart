library mathfacts.sums_generator;

import 'dart:math';
import 'binary_operands.dart';

class SumsGenerator {
  int _index = 0;
  final List<BinaryOperands> _facts = new List<BinaryOperands>();
  String _title;
  
  SumsGenerator(int lowerBound, int upperBound) {
    _title = "Sums from ${lowerBound} to ${upperBound}";
    
    for (int left = 1; left <= 9; ++left) {
      int startingRight = max(lowerBound - left, 1);
      int endingRight = min(upperBound - left, 9);
      
      for (int right = startingRight; right <= endingRight; ++right)
        _facts.add(new BinaryOperands(left, right));
    }

    _facts.shuffle(new Random());
  }
  
  BinaryOperands next() {
    if (_index + 1 > _facts.length) {
      _index = 0;
      _facts.shuffle(new Random());
    }
    return _facts[_index++];
  }
  
  int get count {
    return _facts.length;
  }
  
  String get title {
    return _title;
  }
}