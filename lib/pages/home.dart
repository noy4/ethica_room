import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/balance_lg.png'),
              width: 150,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'エチカの部屋',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 96, color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hello');
              },
              child: Text('はじめる'),
              style: OutlinedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: TextStyle(fontSize: 18, height: 1),
                  side: BorderSide(
                    color: Colors.blue,
                  ),
                  padding: EdgeInsets.only(
                      left: 32, top: 24, right: 32, bottom: 24)),
            ),
            SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
