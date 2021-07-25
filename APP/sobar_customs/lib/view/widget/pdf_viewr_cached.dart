import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:sobar_customs/controller/pdf/pdf_controller.dart';

class MyPdfView extends StatelessWidget {
  final String url;
  MyPdfView({Key key, this.url}) : super(key: key);

  final pdfController = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        children: [
          IconButton(
              onPressed: () {
                pdfController.pdfViewController.setPage(2);
              },
              icon: Icon(Icons.ac_unit)),
          IconButton(
              onPressed: () {
                pdfController.changeNightMode();
              },
              icon: Icon(Icons.laptop))
        ],
      ),
      body: Obx(() => PDF(
            nightMode: pdfController.nightMode.value,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            onViewCreated: (controller) {
              pdfController.pdfViewController = controller;
            },
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onPageChanged: (int page, int total) {
              print('page change: $page/$total');
            },
          ).cachedFromUrl(
            'http://africau.edu/images/default/sample.pdf',
            placeholder: (progress) => Center(child: Text('$progress %')),
            errorWidget: (error) => Center(child: Text(error.toString())),
          )),
    );
  }
}
