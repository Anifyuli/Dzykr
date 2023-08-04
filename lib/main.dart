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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CountWidget(count: count),
            const SizedBox(
              height: 20,
            ),

            // Add button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count = count + 1;
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
                    count = 0;
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
    );
  }
}

class CountWidget extends StatelessWidget {
  const CountWidget({
    super.key,
    required this.count,
  });

  final int count;

  int findModulo(int currentValue) {
    int nearestModulo100Floor = (currentValue ~/ modulo) * modulo;
    if (currentValue % 100 != 0) {
      nearestModulo100Floor = (currentValue ~/ modulo) * modulo;
    } else {
      nearestModulo100Floor = ((currentValue ~/ modulo) - 1) * modulo;
    }
    return nearestModulo100Floor;
  }

  final int modulo = 33;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
            key: ValueKey(count % modulo == 0),
            duration: const Duration(seconds: 3),
            transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: AnimatedOpacity(
                    duration: kThemeAnimationDuration,
                    opacity: 1 - animation.value,
                    child: child,
                  ),
                ),
            child: Transform.translate(
              offset: const Offset(0, -100),
              child: Column(
                key: UniqueKey(),
                children: [
                  if (findModulo(count) != 0 && !findModulo(count).isNegative)
                    Text(
                        'Kamu mencapai ${findModulo(count)}! (${findModulo(count) ~/ modulo}x Putaran)'),
                ],
              ),
            )),
        AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          switchInCurve: Curves.bounceIn,
          switchOutCurve: Curves.easeOut,
          layoutBuilder: (currentChild, previousChildren) =>
              previousChildren.firstOrNull ?? currentChild!,
          transitionBuilder: (child, animation) {
            // log(animation.value.toString());
            return TweenAnimationBuilder(
              duration:
                  kThemeAnimationDuration - const Duration(milliseconds: 100),
              tween: ColorTween(begin: Colors.green, end: Colors.black),
              builder: (context, value, c) => ScaleTransition(
                scale: Tween<double>(
                  begin: 1.5,
                  end: 1,
                ).animate(animation),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      value ?? Colors.transparent, BlendMode.srcATop),
                  child: child,
                ),
              ),
            );
          },
          child: Text(
            count.toString(),
            key: ValueKey(count),
            style: const TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
