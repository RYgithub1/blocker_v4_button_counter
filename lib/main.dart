import 'package:flutter/material.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bloc Button Counter'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}):super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {   /// [setState]
    setState(() {_counter++;});
  }
  void _decrementCounter() {   /// [setState]
    setState(() {_counter--;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom:180),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'push buttons',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Center(
        child: Padding(
          padding: EdgeInsets.only(left:35, bottom:150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              SizedBox(height:20),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
