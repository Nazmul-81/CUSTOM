import 'package:flutter/material.dart';
import 'package:sobar_customs/models/search_model.dart';
import 'package:sobar_customs/utilitis/test_spaning.dart';
import 'package:sobar_customs/view/widget/text_widget.dart';

class SearchItem extends StatelessWidget {
  final SearchModel searchModel;
  final query;

  const SearchItem({Key key, this.searchModel, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Material(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "Hd Code: ",
                        style: DefaultTextStyle.of(context).style,
                        children: textSpanning(
                            '${searchModel.hsCode}', '$query', 22.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "HS Code: ",
                        style: DefaultTextStyle.of(context).style,
                        children: textSpanning(
                            '${searchModel.hsCode2}', '$query', 22.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "Description: ",
                        style: DefaultTextStyle.of(context).style,
                        children: textSpanning(
                            '${searchModel.description}', '$query', 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
