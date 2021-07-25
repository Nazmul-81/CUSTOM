import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sobar_customs/constants/strings.dart';

class FirebaseStorageXLService {
  Future<String> downloadFileFromFirebaseStorage(
      String url, String fileName) async {
    HttpClient httpClient = new HttpClient();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String filePath = '';
    filePath = '$tempPath/$fileName';
    File file = File(filePath);

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print(response.statusCode);
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);

        await file.writeAsBytes(bytes);
      } else {
        filePath = 'Error code: ' + response.statusCode.toString();
      }
    } catch (ex) {
      filePath = 'Something Error';
    }

    return filePath;
  }

  Future<String> getDownloadUrl() async {
    String url = '';
    await FirebaseStorage.instance
        .ref(MyString.searchFileName)
        .getDownloadURL()
        .then((value) => url = value);

    return url;
  }

  Future<bool> checkUpdate() async {
    bool isUpdated = false;
    await FirebaseStorage.instance
        .ref('Tariff for apps.xlsx')
        .getMetadata()
        .then((metaData) async {
      int firebaseFileSize = metaData.size;
      int phoneFileSize = 0;
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      String filePath = '';
      filePath = '$tempPath/${MyString.fileName}';
      File file = File(filePath);

      await file.exists().then((exist) {
        if (exist) {
          int fl = file.lengthSync();
          print(fl);
          print(firebaseFileSize);
          if (fl == firebaseFileSize) {
            isUpdated = true;
          }
        }
      });
    });
    return isUpdated;
  }
}
