import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "dart:developer" as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Type { cat, dog }

abstract class CanRun {
  final Type type;
  const CanRun({
    required this.type,
  });
  @mustCallSuper
  void run() {
    "CanRuns's run function is called".log();
  }
}

class Cat extends CanRun {
  const Cat() : super(type: Type.cat);
  @override
  void run() {
    super.run();
    'Cat running'.log();
  }
}

class Dog extends CanRun {
  const Dog() : super(type: Type.dog);
}

void testIt() {
  const cat = Cat();
  cat.type.log();
  const dog = Dog();
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
