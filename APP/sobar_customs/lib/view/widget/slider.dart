import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobar_customs/models/slider.dart';

class MySlider extends StatefulWidget {
  final List<MySliderModel> imgList;

  const MySlider({Key key, @required this.imgList}) : super(key: key);
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 5,
          child: ClipRRect(
            /*borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(500, 100)),*/
            child: Builder(
              builder: (context) {
                return CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    height: Get.height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                  ),
                  items: widget.imgList
                      .map((item) => Container(
                            color: Colors.black,
                            child: Opacity(
                              opacity: 1,
                              child: ExtendedImage.network(
                                widget.imgList[_current].image,

                                fit: BoxFit.cover,
                                cache: true,
                                border:
                                    Border.all(color: Colors.white, width: 0.0),
                                shape: BoxShape.rectangle,
                                /*borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),*/
                                //cancelToken: cancellationToken,
                              ),
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.imgList.map((url) {
                    int index = widget.imgList.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(0, 0, 0, 1)
                            : Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
