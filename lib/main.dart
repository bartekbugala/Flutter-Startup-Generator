import 'package:flutter/material.dart';

// runApp -> Inflate the given widget and attach it to the screen.
//           The widget is given constraints during layout that force it to fill the entire screen.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // @override -> (annotation) marks an instance member as overriding a superclass member with the same name.
  @override
  // Widget -> Describes the configuration for an [Element].
  // build() -> method that describes how to display the widget in terms of other, lower level widgets.
  // BuildContext -> A handle to the location of a widget in the widget tree.
  //                 This class presents a set of methods that can be used from [StatelessWidget.build] methods and from methods on [State] objects.
  Widget build(BuildContext context) {
    // MaterialApp -> implementation of google Material Design
    return MaterialApp(
        title: 'Starting Flutter Dev',
        // Scaffold -> Implements the basic material design visual layout structure.
        //             This class provides APIs for showing drawers, snack bars, and bottom sheets.
        home: Scaffold(
          appBar: AppBar(title: Text('Welcome to Flutter')),
          body: Center(child: Text('Hello World')),
        ));
  }
}
