import 'package:flutter/material.dart';
import 'quote.dart';


class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  List<Quote> quotes = [
    Quote(author: 'Chizom', text: 'How to cook pizza'),
    Quote(author: 'Elon', text: 'How to make rice balls'),
    Quote(author: 'Chizom', text: 'How to align beans to yam'),
  ];

  // Widget quoteTemplate(quote){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Quotes'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => Card(
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('${quote.text}',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text('- ${quote.author}',
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
    );
  }
}