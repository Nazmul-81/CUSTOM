import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sobar_customs/models/slider.dart';

class ImageService {
  Future<List<MySliderModel>> getImageFromStorage() async {
    var stream = await FirebaseFirestore.instance.collection('slider').get();
    return stream.docs
        .map(
          (e) => MySliderModel(
              e.data()['no'], e.data()['link'], e.data()['image']),
        )
        .toList();
  }
}
