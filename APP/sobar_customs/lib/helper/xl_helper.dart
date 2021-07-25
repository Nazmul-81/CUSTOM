import 'dart:io';

import 'package:excel/excel.dart';
import 'package:sobar_customs/models/search_model.dart';

class XlHelper {
  List<SearchModel> getData(String file) {
    var items = <SearchModel>[];
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    print(excel);
    for (var table in excel.tables.keys) {
      print(table);
      print(excel.tables[table].maxCols);
      print(excel.tables[table].maxRows);
      for (var row in excel.tables[table].rows) {
        print(row.first.value);
        var hsCode = (row[0] != null) ? row[0].value : "";
        var hsCode2 = (row[1] != null) ? row[1].value : "";
        var description = (row[2] != null) ? row[2].value : "";
        var su = (row[3] != null) ? row[3].value : "";
        var cd = (row[4] != null) ? row[4].value : "";
        var rd = (row[5] != null) ? row[5].value : "";
        var sd = (row[6] != null) ? row[6].value : "";
        var vat = (row[7] != null) ? row[7].value : "";
        var ait = (row[8] != null) ? row[8].value : "";
        var at = (row[9] != null) ? row[9].value : "";
        var tti = (row[10] != null) ? row[10].value : "";
        var image = (row[11] != null) ? row[11].value : "";
        var searchItem = SearchModel(hsCode, hsCode2, description, su, cd, rd,
            sd, vat, ait, at, tti, image);
        items.add(searchItem);
      }
    }
    return items;
  }
}
