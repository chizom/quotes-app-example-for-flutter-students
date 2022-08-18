import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//TODO: read json from an api and use it in the app

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  List<dynamic> quotes = [];

  Future <void>? printToConsole(BuildContext context) {
    print('I work');
    return null;
  }

  //Future to run
  Future <List<dynamic>> getQuoteList(BuildContext context) async {
    String url = "https://type.fit/api/quotes";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

    setState(() {
      quotes = responseData;
    });
    print(quotes);
    return quotes;
  }

  // List<Quote> quotes = [
  //   Quote(author: 'Chizom', text: 'How to cook pizza'),
  //   Quote(author: 'Elon', text: 'How to make rice balls'),
  //   Quote(author: 'Chizom', text: 'How to align beans to yam'),
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {getQuoteList(context);});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Quotes'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: quotes.map((quote) => Card(
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('${quote['text']}',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18.0
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text('${quote['author'] == null ? '' : quote['author']}',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13.0
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          quotes.remove(quote);
                        });
                      }, icon: Icon(Icons.delete), color: Colors.red,)
                    ],
                  )
                ],
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }
}
