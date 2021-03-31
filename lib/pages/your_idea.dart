import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethica_room/components/my_mark_down.dart';
import 'package:flutter/material.dart';
import 'package:ethica_room/layout/page_content.dart';

class YourIdeaPage extends StatefulWidget {
  @override
  _YourIdeaPageState createState() => _YourIdeaPageState();
}

class _YourIdeaPageState extends State<YourIdeaPage> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final text = TextEditingController();
  bool submitted = false;

  @override
  Widget build(BuildContext context) {
    return PageContent(
      contents: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyMarkDown('md/your_idea.md'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('名前'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                      child: TextFormField(
                        controller: name,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'くわやな'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '入力してください';
                          }
                          return null;
                        },
                      ),
                    ),
                    Text('あなたにとっての "より良い生き方" または "幸せ" は何ですか。'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                      child: TextFormField(
                        controller: text,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '何かしら自分を表現して生きること、湯船に浸かるのが幸せです。'),
                        maxLines: 4,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '入力してください';
                          }
                          return null;
                        },
                      ),
                    ),
                    Text('みなさんと共有してよければ送信ボタンを押してください。'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                      child: OutlinedButton(
                        onPressed: submitted
                            ? null
                            : () {
                                if (_formKey.currentState.validate()) {
                                  print(name.text);
                                  CollectionReference posts =
                                      Firestore.instance.collection('posts');
                                  posts.add({
                                    'name': name.text,
                                    'text': text.text,
                                    'createdAt': DateTime.now()
                                  }).then((value) {
                                    print("Post Added");
                                    setState(() {
                                      submitted = true;
                                    });
                                  }).catchError((error) {
                                    print("Failed to add post: $error");
                                  });
                                }
                              },
                        child: Text('送信'),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.blue,
                            // textStyle: TextStyle(fontSize: 18, height: 1),
                            side: BorderSide(
                              color: Colors.blue,
                            ),
                            padding: EdgeInsets.only(
                                left: 16, top: 16, right: 16, bottom: 16)),
                      ),
                    ),
                    if (submitted)
                      Text(
                        '送信しました。',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      navLeft: true,
      navRight: {'path': '/everyones-idea'},
      page: '3 / 5',
    );
  }
}
