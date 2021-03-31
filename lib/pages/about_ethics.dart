import 'package:ethica_room/components/my_mark_down.dart';
import 'package:flutter/material.dart';
import 'package:ethica_room/layout/page_content.dart';

class AboutEthicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContent(
      contents: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [MyMarkDown('md/about_ethics.md')],
      ),
      navLeft: true,
      navRight: {'path': '/your-idea'},
      page: '2 / 5',
    );
  }
}
