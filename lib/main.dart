import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "dart:developer" as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class CanRun {
  void run() {
    'Running.......'.log();
  }
}

abstract class CanWalk {
  void walk() {
    'walking...'.log();
  }
}

class Cat with CanRun, CanWalk {}

void testIt() {
  final cat = Cat();
  cat
    ..run()
    ..walk();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mixin",
      theme: ThemeData(primaryColor: Colors.blue),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mixin"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("hello"),
      ),
    );
  }
}
