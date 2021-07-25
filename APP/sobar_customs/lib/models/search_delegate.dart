import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sobar_customs/constants/colors.dart';
import 'package:sobar_customs/controller/search/search_controller.dart';
import 'package:sobar_customs/view/widget/search_item.dart';

class CustomSearchDelegate extends SearchDelegate {
  final searchController = Get.put(SearchController());
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = ThemeData(
      primaryColor: MyColors.appBarColor,
    );
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    return GetX<SearchController>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.searchedItems.length,
          itemBuilder: (_, index) {
            return SearchItem(
              searchModel: controller.searchedItems[index],
              query: query,
            );
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /*if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }*/
    searchController.search(query);
    return GetX<SearchController>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.searchedItems.length,
          itemBuilder: (_, index) {
            return SearchItem(
              searchModel: controller.searchedItems[index],
              query: query,
            );
          });
    });
  }
}
