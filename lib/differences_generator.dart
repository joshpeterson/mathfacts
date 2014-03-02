library mathfacts.differences_generator;

import 'dart:math';
import 'binary_operands.dart';

class DifferencesGenerator {
  int _index = 0;
  final List<BinaryOperands> _facts = new List<BinaryOperands>();
  String _title;
  
  DifferencesGenerator(int lowerBound, int upperBound) {
    _title = "Differences from ${lowerBound} to ${upperBound}";
    
    for (int left = upperBound; left >= lowerBound; --left) {
      for (int right = left; right >= lowerBound; --right) {
        _facts.add(new BinaryOperands(left, right));
      }
    }
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