import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  TextEditingController submitController = TextEditingController();
  List<String> notes = [];

  @override
  void dispose() {
    submitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: Center(
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(50),
              child: const Center(
                  child: Text(
                "Make some notes!",
                style: TextStyle(fontSize: 36, color: Colors.white),
              )),
            ),
            SizedBox(
                width: 700,
                child: TextField(
                  onSubmitted: (t) {
                    setState(() {
                      notes.add(t);
                      submitController.clear();
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  controller: submitController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.indigo[100]),
                    hintText: "Start writing a note",
                    fillColor: Colors.white,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        notes.add(submitController.text);
                        submitController.clear();
                      });
                    },
                    child: const Text("Submit"))),
            Flexible(
                child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 300),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(notes[index],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                );
              },
            ))
          ]),
        ),
      ),
    );
  }
}
