import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchNews() async{
  String apiKey = '3bc0d88da82f45ca8b274c12c19a5bc9';
  String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey="+apiKey;

  var response = await http.get(Uri.parse(url));
  return response.body;
}

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchNews(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Text(snapshot.data.toString());
        }else{
          return Center(
              child: CircularProgressIndicator()
          );
        }
        return Container();
      },

    );
  }
}