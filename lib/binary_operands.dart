library mathfacts.binary_operands;

class BinaryOperands {
  final int left;
  final int right;
  
  BinaryOperands(this.left, this.right);
  
  bool operator ==(BinaryOperands other) {
    if (other == null)
      return identical(this, other);
    return other.left == left && other.right == right;
  }
  
  int get hashCode {
    return left.hashCode + right.hashCode;
  }
  
  String toString() {
    return "left: ${left} right: ${right}";
  }
}