import 'dart:math';
class BMIBrain {
  final int height;
  final int weight;
  double _result;

  BMIBrain({this.height, this.weight});

  String bmiValue (){
   _result= weight/pow(height/100, 2);
   return _result.toStringAsFixed(1);
  }

  String bmiResult () {
    if (_result >= 25){
      return 'OVERWEIGHT';
    }else if (_result > 18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }

  }

  String bmiInterpretation () {
    
    if (_result >= 25){
      return 'Your BMI is high, may be you need to lose some weight';
    }else if (_result > 18){
      return 'Your weight and height perfect as per your age';
    }else{
      return 'Your BMI is low, may be you need to gain weight';
    }
    
  }
}