import 'package:counter_app/screens/grid_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController mController = TextEditingController();
  final TextEditingController nController = TextEditingController();
  final TextEditingController alphabetController = TextEditingController();
  bool isAlphabetAllowed = false;
  late int widthGrid;
  late int heightGrid;

  showAlphabetGetter() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SizedBox(
              width: 400,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Enter m:"),
                      const Spacer(),
                      Expanded(
                        child: TextField(
                          controller: mController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter m',
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Enter n:"),
                      const Spacer(),
                      Expanded(
                        child: TextField(
                          controller: nController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter n',
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Center(
                                child: Column(
                                  children: [
                                    const Text("Enter Alphabets"),
                                    TextField(
                                      controller: alphabetController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter Alphabets',
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => GridPage(
                                                rows:
                                                    int.parse(mController.text),
                                                columns:
                                                    int.parse(nController.text),
                                                alphabets:
                                                    alphabetController.text,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text("Next")),
                                  ],
                                ),
                              ));
                    },
                    child: const Text(
                      'Submit',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
