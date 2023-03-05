import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  int luckynumber = 0;

  void _LuckyNumber() {
    setState(() {
      luckynumber = random.nextInt(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottery App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: Text(
              'Lottery winning number is 4',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: luckynumber == 4
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.done_all_outlined,
                              color: Color(0xff669532),
                            ),
                          ),
                          // SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Congratulation you have won the lottery, \n your number is $luckynumber',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                          // SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Batter luck for the next time,\n your number is $luckynumber',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _LuckyNumber,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
