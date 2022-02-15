import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "dart:developer" as devtools show log;
import 'dart:io';
import 'package:meta/meta.dart';
import 'dart:convert';

extension Log on Object {
  void log() => devtools.log(toString());
}

extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(
    String url,
  ) =>
      HttpClient().getUrl(Uri.parse(url)).then(
            (req) => req.close(),
          );
}

mixin CanMakeGetCall {
  String get url;
  @useResult
  Future<String> getString() => getUrl(
        url,
      ).then(
        (resp) => resp
            .transform(
              utf8.decoder,
            )
            .join(),
      );
}

@immutable
class GetPeople with CanMakeGetCall {
  const GetPeople();
  @override
  String get url => 'http://127.0.0.1:5500/api/people.json';
}

void testIt() async {
  final people = await const GetPeople().getString();
  people.log();
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
