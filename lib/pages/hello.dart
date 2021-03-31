import 'package:ethica_room/components/my_mark_down.dart';
import 'package:ethica_room/layout/page_content.dart';
import 'package:flutter/material.dart';

class HelloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContent(
      contents: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [MyMarkDown('md/hello.md')],
      ),
      navRight: {'path': '/about-ethics'},
      page: '1 / 5',
    );
  }
}
