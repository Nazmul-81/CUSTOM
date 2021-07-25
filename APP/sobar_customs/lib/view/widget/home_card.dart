import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sobar_customs/view/widget/text_widget.dart';

class MyHomeCard extends StatelessWidget {
  final icon;
  final label;

  final onClick;

  const MyHomeCard({Key key, this.icon, this.label, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onClick,
        child: AspectRatio(
          aspectRatio: 1,
          child: Material(
            color: Colors.white,
            elevation: 4,
            //borderRadius: BorderRadius.circular(30),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 36,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    MyText(
                      label: label,
                      fontWeight: FontWeight.bold,
                      size: 20.0,
                      color: Colors.red,
                      textAlignment: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
