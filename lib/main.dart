import 'package:flutter/material.dart';
import 'class/artice.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      title: "Hackers News",
      home: HomePage(
        title: "Hackers News",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> _articles = articles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _articles.removeAt(0);
          });
          return;
        },
        child: ListView(
          children: _articles.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.title),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 30),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Text(
              //   "Name ${article.by}",
              //   style: TextStyle(fontSize: 18),
              // ),
              Text(
                "${article.commentCount} comments",
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  final fakeUrl = "http://${article.domain} ";
                  if (await canLaunch(fakeUrl)) {
                    launch(fakeUrl);
                  } else {
                    throw "Cannot Launch the $fakeUrl";
                  }
                },
              )
            ],
          )
        ],
        // trailing: CircleAvatar(
        //   child: Text(article.commentCount.toString()),
        //   backgroundColor: Colors.blueGrey,
        // ),
        // leading: InkWell(
        //   splashColor: Colors.yellow,
        //   hoverColor: Colors.blue,
        //   child: CircleAvatar(
        //     child: Text(
        //       article.by[0],
        //       style: TextStyle(fontSize: 15),
        //     ),
        //   ),
        //   onTap: () {
        //     print("Button is pressed");
        //   },
        // ),
      ),
    );
  }
}
