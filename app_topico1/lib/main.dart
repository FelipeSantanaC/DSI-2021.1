import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NomeStartup());
}

class NomeStartup extends StatelessWidget {
  const NomeStartup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Experiência com Flutter',
      home: RandomWords(),
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 14.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nomes para Startups'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          // #docregion listTile
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}