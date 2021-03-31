import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MyMarkDown extends StatelessWidget {
  MyMarkDown(this.src);
  final String src;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString(src),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return MarkdownBody(
              data: snapshot.data,
              styleSheet: MarkdownStyleSheet(
                  h1: TextStyle(letterSpacing: 1),
                  p: TextStyle(letterSpacing: 1, height: 2),
                  blockSpacing: 32,
                  horizontalRuleDecoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 1,
                              color: Theme.of(context).dividerColor)))),
            );
          }

          return Center();
        });
  }
}
