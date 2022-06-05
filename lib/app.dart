import 'package:flutter/material.dart';

import 'api_services/api_calling.dart';
import 'model/api_model.dart';

class App extends StatelessWidget {
  final String flavour;
  const App({super.key, required this.flavour});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: flavour,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

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
