import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// runApp -> Inflate the given widget and attach it to the screen.
//           The widget is given constraints during layout that force it to fill the entire screen.

void main() => runApp(MyApp());

// StatelessWidget -> Immutable Widget, that does not require state. Their properties can't change - all values are final
class MyApp extends StatelessWidget {
  // @override -> (annotation) marks an instance member as overriding a superclass member with the same name.
  @override // for methods where the superclass is not under the programmer's control, the superclass is in a different library or package, and it is not considered stable.
  // Widget -> Describes the configuration for an [Element].
  // build() -> method that describes how to display the widget in terms of other, lower level widgets.
  // BuildContext -> A handle to the location of a widget in the widget tree.
  //                 This class presents a set of methods that can be used from [StatelessWidget.build] methods and from methods on [State] objects.
  Widget build(BuildContext context) {
    // MaterialApp -> implementation of google Material Design
    return MaterialApp(
        title: 'Startup Name Generator',
        // Scaffold -> Implements the basic material design visual layout structure.
        //             This class provides APIs for showing drawers, snack bars, and bottom sheets.
        home: RandomWords());
  }
}

// State -> The logic and internal state for a [StatefulWidget].
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // itemBuilder -> Creates a scrollable, linear array of widgets that are created on demand.
        //              here the itemBuilder callback is called once per suggested word pairing,
        //              and places each suggestion into a ListTile row.
        //              For even rows, the function adds a ListTile row for the word pairing. For odd rows,
        //              the function adds a Divider widget to visually separate the entries.
        //              Note that the divider might be difficult to see on smaller devices.
        itemBuilder: (context, i) {
          //  Divider here adds a one-pixel-high divider widget before each row in the ListView.
          if (i.isOdd) return Divider();

          // The expression i ~/ 2 divides i by 2 and returns an integer result.
          // equivalent (a / b).truncate().toInt().
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings in the ListView, minus the divider widgets.
          final index = i ~/ 2;
          // If you’ve reached the end of the available word pairings,
          if (index >= _suggestions.length) {
            // then generate 10 more and add them to the suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ));
  }
}

// StatefulWidget -> A widget that has mutable state.
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
