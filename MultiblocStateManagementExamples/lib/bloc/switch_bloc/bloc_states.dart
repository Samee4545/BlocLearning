import 'package:equatable/equatable.dart';

class switchStates extends Equatable {
  bool isSwitched;
  double sliderValue;
  switchStates({this.isSwitched = false, this.sliderValue = 1.0});

  switchStates copyWith({bool? isSwitched, double? sliderValue}) {
    return switchStates(
        isSwitched: isSwitched ?? this.isSwitched,
        sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  List<Object> get props => [isSwitched, sliderValue];
}
