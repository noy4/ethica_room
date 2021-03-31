import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 240,
            child: DrawerHeader(
              child: Column(
                children: [
                  Image(
                    image: AssetImage('images/balance_lg.png'),
                    width: 150,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'エチカの部屋',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
          ),
          ListTile(
            title: Text('ホーム'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          Mokuji(),
          ListTile(
            title: Text('概要'),
            onTap: () {
              Navigator.pushNamed(context, '/abstract');
            },
          ),
          ListTile(
            title: Text('元ネタ'),
            onTap: () {
              launch('https://tonarinoyj.jp/episode/13933686331754900481');
            },
          ),
        ],
      ),
    );
  }
}

class Mokuji extends StatefulWidget {
  @override
  _MokujiState createState() => _MokujiState();
}

class _MokujiState extends State<Mokuji> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool yo) {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: Colors.transparent,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(title: Text('目次'));
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(children: [
                ListTile(
                  title: Text('1. はじめに'),
                  onTap: () {
                    Navigator.pushNamed(context, '/hello');
                  },
                ),
                ListTile(
                  title: Text('2. 倫理とは'),
                  onTap: () {
                    Navigator.pushNamed(context, '/about-ethics');
                  },
                ),
                ListTile(
                  title: Text('3. あなたの考え'),
                  onTap: () {
                    Navigator.pushNamed(context, '/your-idea');
                  },
                ),
                ListTile(
                  title: Text('4. みんなの考え'),
                  onTap: () {
                    Navigator.pushNamed(context, '/everyones-idea');
                  },
                ),
                ListTile(
                  title: Text('5. おわりに'),
                  onTap: () {
                    Navigator.pushNamed(context, '/bye-bye');
                  },
                ),
              ]),
            ),
            isExpanded: isExpanded),
      ],
    );
  }
}
