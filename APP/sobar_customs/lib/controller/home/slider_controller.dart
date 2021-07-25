import 'package:get/get.dart';
import 'package:sobar_customs/models/slider.dart';
import 'package:sobar_customs/service/image_service.dart';

class SliderController extends GetxController {
  var slideImage = <MySliderModel>[].obs;
  List<MySliderModel> get imageList => slideImage;
  @override
  void onInit() {
    ImageService()
        .getImageFromStorage()
        .then((value) => slideImage.value = value);
    super.onInit();
  }
}
