import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobar_customs/constants/colors.dart';
import 'package:sobar_customs/controller/home/slider_controller.dart';
import 'package:sobar_customs/models/search_delegate.dart';
import 'package:sobar_customs/utilitis/test_spaning.dart';
import 'package:sobar_customs/view/pages/content/content_page.dart';
import 'package:sobar_customs/view/widget/home_card.dart';
import 'package:sobar_customs/view/widget/pdf_viewr_cached.dart';
import 'package:sobar_customs/view/widget/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sliderController = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    //textSpanning();
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: MyColors.appBarColor,
            floating: true,
            snap: true,
            title: Text("Sabar Customs"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: Get.height * .35,
              child: MySlider(
                imgList: sliderController.imageList,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyHomeCard(
                      icon: Icons.laptop_windows,
                      label: "LAW",
                      onClick: () {
                        Get.to(() => MyContentPage());
                      },
                    ),
                  ),
                  Expanded(
                    child: MyHomeCard(
                      icon: Icons.search,
                      label: "SEARCH",
                      onClick: () {
                        showSearch(
                            context: context, delegate: CustomSearchDelegate());
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyHomeCard(
                      icon: Icons.laptop_windows,
                      label: "PDF",
                      onClick: () {
                        Get.to(() => MyPdfView());
                      },
                    ),
                  ),
                  Expanded(
                    child: MyHomeCard(
                      icon: Icons.search,
                      label: "SEARCH",
                      onClick: () {
                        showSearch(
                            context: context, delegate: CustomSearchDelegate());
                      },
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
