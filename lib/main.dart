import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class CompanyColors {
  CompanyColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> red = const <int, Color> {
    50: const Color(0xFFe91e37),
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: CompanyColors.red[50],
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final staffnames = [
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
    'Hnin Ei',
  ];
  final staff = [
    {
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '007455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '007425'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '007445'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '001455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '004455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '007415'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '000455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '007055'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '107455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '207455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '307455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '407455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '507455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '607455'
    },{
      'name':'Hnin Ei',
      'designation': 'Associate Developer',
      'id': '707455'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = _saved.map(
      (WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
          subtitle: new Text("Associate Developer")
        );
      },
    );
    final List<Widget> divided = ListTile
      .divideTiles(
        context: context,
        tiles: tiles,
      )
      .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Yoma IT staff'),
      ),
      body: _buildSuggestions(),
      drawer: new Drawer(
        child: ListView(
          children: divided
          )
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(   
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),  
      onTap: () {   
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else { 
            _saved.add(pair); 
          } 
        });
      }, 
    );
  }
}