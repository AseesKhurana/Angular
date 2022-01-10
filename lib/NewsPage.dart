import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'WebViewPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NewsPage(),
      ),
    );
  }
}

Future<String> fetchNews() async{
  String apiKey = '3bc0d88da82f45ca8b274c12c19a5bc9';
  String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey="+apiKey;

  var response = await http.get(Uri.parse(url));
  return response.body;
}

class NewsPage extends StatelessWidget {

  parseNews(String response, BuildContext context){
    var mapAsData = convert.jsonDecode(response);
    List articles = mapAsData['articles'];

    List<Widget> widgets = [];

    articles.forEach((element) {
      widgets.add(element["urlToImage"] != null ? Image.network(element["urlToImage"]) : Container());
      widgets.add(Divider());
      widgets.add(
          ListTile(
            title: Text(element["title"]),
            subtitle: Text(element["publishedAt"]) ,
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebViewPage(url: element['url']))
              );
            },
      )
      );
      widgets.add(Divider());
    });
    return ListView(
      padding: EdgeInsets.all(8),
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext
  context) {

    return FutureBuilder(
      future: fetchNews(),

      builder: (context, snapshot) {
        if(snapshot.hasData){
          return parseNews(snapshot.data.toString(), context);
        }else{
          return Center(
              child: CircularProgressIndicator()
          );
        }
      },

    );
  }
}