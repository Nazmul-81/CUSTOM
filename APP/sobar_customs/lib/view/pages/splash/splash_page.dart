import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sobar_customs/constants/colors.dart';
import 'package:sobar_customs/constants/images.dart';
import 'package:sobar_customs/view/pages/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1))
        .then((value) => Get.to(() => HomePage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.splashBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                Images.logo,
                height: Get.height * .4,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: Get.width * .3,
            height: Get.height * .3,
            child: LoadingIndicator(
              indicatorType: Indicator.ballRotate,
              colors: const [Colors.red, Colors.green, Colors.blue],
              strokeWidth: 1,
            ),
          )
        ],
      ),
    );
  }
}
