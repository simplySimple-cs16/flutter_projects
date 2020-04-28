import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  CalculatorBrain({this.height, this.weight});

  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return 'Do some exercise';
    else if (_bmi > 18.5)
      return 'Keep it up';
    else
      return 'Eat and gain more';
  }
}
