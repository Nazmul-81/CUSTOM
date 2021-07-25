import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

class PdfController extends GetxController {
  var nightMode = false.obs;

  PDFViewController pdfViewController;

  changeNightMode() {
    nightMode.toggle();
    print(nightMode.value);
  }
}
