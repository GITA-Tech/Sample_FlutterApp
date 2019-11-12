import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';
import 'package:flutter_web_ui/ui.dart' as ui;

class Counter extends StatefulWidget {
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  double val;

  void initState() {
    super.initState();
    val = 0;
  }

  void change() {
    setState(() {
      val += 1;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('$val'))),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          child: Counter(),
        ),
      ),
    );
  }
}

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  runApp(MyApp());
}
