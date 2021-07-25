import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<TextSpan> textSpanning(String d, String q, size) {
  String data = d.toLowerCase();
  String query = q.toLowerCase();

  var ar = data.split(query);

  List<TextSpan> list = [];

  if (ar.length >= 2) {
    list.add(
      TextSpan(
        text: '${ar[0]}',
        style: TextStyle(
          fontSize: size,
        ),
      ),
    );
    for (int i = 1; i < ar.length; i++) {
      list.add(TextSpan(
          text: '$query',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            background: Paint()..color = Colors.yellow,
            fontSize: size,
          )));
      list.add(
        TextSpan(
          text: '${ar[i]}',
          style: TextStyle(
            fontSize: size,
          ),
        ),
      );
    }
  } else {
    list.add(TextSpan(
      text: '$data',
      style: TextStyle(
        fontSize: size,
      ),
    ));
  }

  return list;
}
