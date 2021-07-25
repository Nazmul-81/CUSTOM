import 'package:cloud_firestore/cloud_firestore.dart';

class MySliderModel {
  final int no;
  final String link;
  final String image;

  MySliderModel(this.no, this.link, this.image);

  Map<String, dynamic> toMap() {
    return {'no': no, 'link': link, 'image': image};
  }

  static MySliderModel toObj(DocumentSnapshot documentSnapshot) {
    return MySliderModel(documentSnapshot['no'], documentSnapshot['link'],
        documentSnapshot['image']);
  }
}
