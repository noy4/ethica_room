import 'package:flutter/material.dart';

class NavigationRow extends StatelessWidget {
  final bool left;
  final Map right;
  NavigationRow({this.left = false, this.right});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        left
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '戻る',
                  style: TextStyle(color: Colors.blue),
                ))
            : SizedBox(),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, right['home'] != null ? '/' : right['path']);
            },
            child: Text(
              right['home'] != null ? 'ホームへ' : '次へ',
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
