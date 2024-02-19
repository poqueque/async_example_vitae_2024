import 'package:async_example/models/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "No data";
  String error = "";
  ZipCode? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: TextField(
                onSubmitted: (value) {
                  _asyncCall(value);
                },
                style: TextStyle(
                  fontSize: 48,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            if (result != null)
              for (var place in result!.places)
                Column(
                  children: [
                    Text(place.placeName),
                    Text(place.state),
                    Text("(${place.longitude},${place.latitude})"),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
            if (result == null)
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _asyncCall(String postalCode) async {
    try {
      var response =
          await http.get(Uri.parse("https://api.zippopotam.us/es/$postalCode"));
      var jsonData = response.body;
      result = zipCodeFromJson(jsonData);
      setState(() {});
    } on Error catch (exception) {
      result = null;
      error = "No se encuentran datos para $postalCode";
      setState(() {});
    }
  }
}
