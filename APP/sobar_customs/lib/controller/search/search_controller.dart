import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sobar_customs/constants/strings.dart';
import 'package:sobar_customs/helper/xl_helper.dart';
import 'package:sobar_customs/models/search_model.dart';
import 'package:sobar_customs/service/firebase_storage_xl_service.dart';

class SearchController extends GetxController {
  var itemList = <SearchModel>[].obs;
  List<SearchModel> get items => itemList;

  var searchedItemList = <SearchModel>[].obs;
  List<SearchModel> get searchedItems => searchedItemList;

  var totalItem = 0.obs;

  @override
  void onInit() {
    FirebaseStorageXLService().checkUpdate().then((isUpdated) async {
      if (isUpdated) {
        print("OK");
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        String filePath = '';
        filePath = '$tempPath/${MyString.fileName}';
        itemList.value = XlHelper().getData(filePath);
        print("Total Row: ${itemList.value.length}");
      } else {
        FirebaseStorageXLService().getDownloadUrl().then((url) {
          FirebaseStorageXLService()
              .downloadFileFromFirebaseStorage(url, MyString.fileName)
              .then((file) {
            itemList.value = XlHelper().getData(file);
            print("Total Row: ${itemList.value.length}");
          });
        });
      }
    });
    super.onInit();
  }

  search(search) {
    searchedItemList.value = [];
    List<SearchModel> li = [];
    items.forEach((element) {
      /*if (element.toString().contains(search)) {
        li.add(element);
        print(element.hsCode2);
      }*/
      if (element.hsCode.toString().contains(search)) {
        li.add(element);
        print(element.hsCode);
      }
    });
    searchedItemList.value = li;
    totalItem.value = searchedItems.length;
  }
}
