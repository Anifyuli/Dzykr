import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int num = 0; // Counted dhikr
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Dzykr')),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Dhikr counted value
              Text(
                num.toString(),
                style: const TextStyle(fontSize: 120),
              ),
              const SizedBox(
                height: 20,
              ),

              // Add button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    num++;
                  });
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(32, 20, 32, 20)),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const Spacer(),

              // Reset button
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(bottom: 30, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num = 0;
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(32, 20, 32, 20)),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Icon(
                    Icons.autorenew,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),

              // Option button
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(bottom: 30, right: 20),
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(32, 20, 32, 20)),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Icon(
                    Icons.menu_rounded,
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
