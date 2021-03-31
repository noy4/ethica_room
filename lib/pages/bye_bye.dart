import 'package:ethica_room/components/my_mark_down.dart';
import 'package:flutter/material.dart';
import 'package:ethica_room/layout/page_content.dart';

class ByeByePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContent(
      contents: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [MyMarkDown('md/bye_bye.md')],
      ),
      navLeft: true,
      navRight: {'home': true},
      page: '5 / 5',
    );
  }
}
