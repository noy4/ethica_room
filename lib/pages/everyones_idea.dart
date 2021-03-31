import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethica_room/components/my_mark_down.dart';
import 'package:flutter/material.dart';
import 'package:ethica_room/layout/page_content.dart';

class EveryonesIdeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference posts = Firestore.instance.collection('posts');
    return PageContent(
      contents: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyMarkDown('md/everyones_idea.md'),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 48, 0, 4),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    Text(
                      'みなさんの考え',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  stream:
                      posts.orderBy('createdAt', descending: true).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return _buildList(context, snapshot.data.documents);
                  }),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 48),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(5)),
                ),
              ),
            ],
          ),
        ],
      ),
      navLeft: true,
      navRight: {'path': '/bye-bye'},
      page: '4 / 5',
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Container(
      color: Colors.blue[50],
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Container(
            height: 400,
            child: ListView(
              children: snapshot
                  .map((data) => _buildListItem(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    CollectionReference posts = Firestore.instance.collection('posts');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      elevation: 0,
      child: GestureDetector(
        onDoubleTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text('消しちゃう？'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            posts.document(data.documentID).delete();
                            Navigator.of(context).pop();
                          },
                          child: Text('うん'))
                    ],
                  ));
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image(
                      image: AssetImage('images/balance.png'),
                      width: 24,
                    ),
                  ),
                  Text(data['name'])
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 8), child: Text(data['text']))
            ],
          ),
        ),
      ),
    );
  }
}
