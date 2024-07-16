import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloc/bloc/switch_bloc/bloc_states.dart';
import 'package:multibloc/bloc/switch_bloc/switchbloc.dart';
import 'package:multibloc/bloc/switch_bloc/switchbloc_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Bloc Exapmles'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                BlocBuilder<SwitchBloc, switchStates>(
                    buildWhen: (previous, current) {
                  return previous.isSwitched != current.isSwitched;
                }, builder: ((context, state) {
                  return Switch(
                      value: state.isSwitched,
                      onChanged: (newValue) {
                        context
                            .read<SwitchBloc>()
                            .add(enableOrDisableNotification());
                      });
                }))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, switchStates>(builder: ((context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.sliderValue),
              );
            })),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, switchStates>(
                buildWhen: (previous, current) {
              return previous.sliderValue != current.sliderValue;
            }, builder: ((context, state) {
              return Slider(
                  value: state.sliderValue,
                  onChanged: (newValue) {
                    context
                        .read<SwitchBloc>()
                        .add(sliderEvent(sliderValue: newValue));
                  });
            }))
          ],
        ),
      ),
    );
  }
}
