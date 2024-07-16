import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multibloc/Utils/image_picker_util.dart';
import 'package:multibloc/bloc/ImagepickerBloc/image_picker_events.dart';
import 'package:multibloc/bloc/ImagepickerBloc/image_picker_states.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  final imagePickerUtils imagePickerUtil;
  ImagePickerBloc(this.imagePickerUtil) : super(ImagePickerStates()) {
    on<CaptureImage>(cameraCapture);
  }
  void cameraCapture(
      CaptureImage event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtil.cameraCapture();
    emit(state.copyWith(imagefile: file));
  }

  void galleryImage(
      GalleryIamgePicker event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtil.gallreyImage();
    emit(state.copyWith(imagefile: file));
  }
}
