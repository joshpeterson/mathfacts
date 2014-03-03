library mathfacts.fact_enumerable;

import 'fact_enumerator.dart'; 

abstract class FactEnumerable {
  FactEnumerator getEnumerator();
}