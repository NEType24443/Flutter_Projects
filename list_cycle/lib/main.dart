import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Dio Brando',text: 'Ora Ora! Ora! Ora!! Ora!!!'),
    Quote(author: 'Mayoi Hachkuji', text: 'Kami mashta :P'),
    Quote(author: 'Every tsundere ever', text: 'Urusai konno baka!')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Awesome Quotes"
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),
          ),
        ],
      ),
    );
  }
}

