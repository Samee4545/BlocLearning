import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class enableOrDisableNotification extends SwitchEvent {}

class sliderEvent extends SwitchEvent {
  double sliderValue;
  sliderEvent({required this.sliderValue});
  @override
  List<Object> get props => [sliderValue];
}
