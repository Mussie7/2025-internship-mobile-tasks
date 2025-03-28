import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: const Color(0xFF3F51F3)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20.0),

          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11.0)),
              color: const Color(0xFFCCCCCC),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mar 27, 2025', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12.0)),
            SizedBox(height: 2.0),
            Text.rich(
              TextSpan(
                text: 'Hello, ',
                style: TextStyle(fontSize: 16),
                children: [TextSpan(text: 'John', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))],
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                debugPrint('Notification button tapped');
              },
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                padding: EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/iconsax-svg/Svg/All/outline/notification-bing.svg',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
