import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      title: "TODO APP",
      home: TODOAPP(),
      debugShowCheckedModeBanner: false,
    ));

class TODOAPP extends StatefulWidget {
  const TODOAPP({super.key});

  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String value = '';
  var listToDo = [
    '',
  ];
  addToDo(String item) {
    setState(() {
      listToDo.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TODO APP"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addToDo(value);
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: listToDo.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Add Item"),
                        onChanged: (val) {
                          value = val;
                        },
                      ),
                    )
                  : ListTile(
                      leading: const Icon(Icons.work),
                      title: Text(
                        listToDo[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
            }));
  }
}
