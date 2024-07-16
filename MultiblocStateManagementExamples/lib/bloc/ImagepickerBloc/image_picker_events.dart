import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  ImagePickerEvents();

  @override
  List<Object> get props => [];
}

class CaptureImage extends ImagePickerEvents {}

class GalleryIamgePicker extends ImagePickerEvents {}
