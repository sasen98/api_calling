import 'package:api_example/api_calling.dart';
import 'package:api_example/api_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  List<ApiModel> list = [];
  @override
  void didChangeDependencies() async {
    list = await ApiCalling().getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "id:   ${list[index].id!}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("userId:   ${list[index].userId!}"),
              Text("Title:   ${list[index].title!}"),
              Text("Body:   ${list[index].body!}"),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
