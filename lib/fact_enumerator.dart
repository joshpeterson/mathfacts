library mathfacts.fact_enumerator;

import 'dart:math';
import 'binary_operands.dart';

class FactEnumerator {
  int _index = 0;
  final List<BinaryOperands> _facts;
  
  FactEnumerator(this._facts);
  
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
}