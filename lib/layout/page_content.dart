import 'package:ethica_room/components/my_drawer.dart';
import 'package:ethica_room/components/navigation_row.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  PageContent({this.contents, this.navLeft = false, this.navRight, this.page});
  final Column contents;
  final bool navLeft;
  final Map navRight;
  final String page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('エチカの部屋'),
        ),
        body: ListView(children: [
          Container(
              margin: EdgeInsets.all(16),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Column(children: [
                    Row(
                      children: [
                        Expanded(
                            child: Card(
                                child: Container(
                          margin: EdgeInsets.all(8),
                          child: Container(
                              padding: EdgeInsets.all(16), child: contents),
                        )))
                      ],
                    ),
                    NavigationRow(
                      left: navLeft,
                      right: navRight,
                    ),
                    page != null
                        ? Row(
                            children: [
                              Expanded(
                                  child: Text(
                                page,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ))
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 96,
                    )
                  ]),
                ),
              )),
        ]),
        drawer: MyDrawer());
  }
}
