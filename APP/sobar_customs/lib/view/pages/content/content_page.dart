import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContentPage extends StatefulWidget {
  const MyContentPage({Key key}) : super(key: key);

  @override
  _MyContentPageState createState() => _MyContentPageState();
}

class _MyContentPageState extends State<MyContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Learning"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            //margin: EdgeInsets.all(10),
            // color: Colors.green,
            child: ExpansionPanelList(
              animationDuration: Duration(milliseconds: 500),
              children: _books.map<ExpansionPanel>((Item item) {
                return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        'Click To Expand',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  body: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Description text',
                              style: TextStyle(color: Colors.black)),
                        );
                      }),
                  canTapOnHeader: true,
                  isExpanded: item.isExpanded,
                );
              }).toList(),
              dividerColor: Colors.grey,
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _books[index].isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ]),
      ),
    );
  }

  List<Item> _books = generateItems(8);
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Book $index',
      expandedValue: 'Details for Book $index goes here',
    );
  });
}
