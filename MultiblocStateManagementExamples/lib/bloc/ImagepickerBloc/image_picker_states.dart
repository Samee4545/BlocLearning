import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerStates extends Equatable {
  final XFile? imagefile;
  const ImagePickerStates({
    this.imagefile,
  });

  ImagePickerStates copyWith({XFile? imagefile}) {
    return ImagePickerStates(
      imagefile: imagefile ?? this.imagefile,
    );
  }

  @override
  List<Object?> get props => [imagefile];
}
