import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dzykr'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                '99',
                style: TextStyle(fontSize: 120),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(32, 20, 32, 20)),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(bottom: 30, right: 20),
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(32, 20, 32, 20)),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
