import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "dart:developer" as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class CanRun {
  String get type {
    if (this is Cat) {
      return 'Cat';
    } else {
      return "Something else";
    }
  }

  @mustCallSuper
  void run() {
    "CanRuns's run function is called".log();
  }
}

class Cat extends CanRun {
  @override
  void run() {
    super.run();
    'Cat running'.log();
  }
}

class Dog extends CanRun {}

void testIt() {
  final cat = Cat();
  cat.type.log();
  final dog = Dog();
  dog.type.log();
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
