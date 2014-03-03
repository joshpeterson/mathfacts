library mathfacts.differences_generator;

import 'fact_enumerable.dart';
import 'fact_enumerator.dart';
import 'binary_operands.dart';

class DifferencesGenerator implements FactEnumerable {
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
  
  FactEnumerator getEnumerator() {
    return new FactEnumerator(_facts);
  }
  
  String get title {
    return _title;
  }
}