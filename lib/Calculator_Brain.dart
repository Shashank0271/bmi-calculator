import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  final int height, weight;
  double _bmi;
  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25)
      return "Overweight";
    else if (_bmi >= 18.5) return "Normal";
    return "Underweight";
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return "You have higher than normal body weight , try to exercise more !";
    else if (_bmi >= 18.5) return "You have a normal body weight .Good job !";
    return "You have lower body weight , try and eat more !";
  }
}
