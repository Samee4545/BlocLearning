import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloc/bloc/ImagepickerBloc/image_picker_bloc.dart';
import 'package:multibloc/bloc/ImagepickerBloc/image_picker_events.dart';
import 'package:multibloc/bloc/ImagepickerBloc/image_picker_states.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Bloc"),
      ),
      body: Column(
        children: [
          BlocBuilder<ImagePickerBloc, ImagePickerStates>(
            builder: (context, state) {
              if (state.imagefile == null) {
                return InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CaptureImage());
                  },
                  child: Center(
                    child: CircleAvatar(
                      child: Icon(Icons.camera),
                    ),
                  ),
                );
              } else {
                return Image.file(File((state.imagefile!.path.toString())));
              }
            },
          ),
          BlocBuilder<ImagePickerBloc, ImagePickerStates>(
            builder: (context, state) {
              if (state.imagefile == null) {
                return InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(GalleryIamgePicker());
                  },
                  child: Center(
                      child: CircleAvatar(
                    child: Icon(Icons.browse_gallery),
                  )),
                );
              } else {
                return Image.file(File(state.imagefile!.path.toString()));
              }
            },
          )
        ],
      ),
    );
  }
}
