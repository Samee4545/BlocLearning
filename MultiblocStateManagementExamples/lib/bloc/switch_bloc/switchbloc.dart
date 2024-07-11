import 'package:bloc/bloc.dart';
import 'package:multibloc/bloc/switch_bloc/bloc_states.dart';
import 'package:multibloc/bloc/switch_bloc/switchbloc_events.dart';

class SwitchBloc extends Bloc<SwitchEvent, switchStates> {
  SwitchBloc() : super(switchStates()) {
    on<enableOrDisableNotification>(_enableOrDisableNotification);
    on<sliderEvent>(_slider);
  }
  void _enableOrDisableNotification(
      enableOrDisableNotification event, Emitter<switchStates> emit) {
    emit(state.copyWith(isSwitched: !state.isSwitched));
  }

  void _slider(sliderEvent event, Emitter<switchStates> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
