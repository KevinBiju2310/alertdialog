import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  TextEditingController _location = TextEditingController();
  TextEditingController _stringA = TextEditingController();
  TextEditingController _stringB = TextEditingController();
  TextEditingController _intA = TextEditingController();
  TextEditingController _intB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 150, left: 150),
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _location,
                                decoration: const InputDecoration(
                                    hintText: "Enter Location"),
                              ),
                              TextFormField(
                                controller: _stringA,
                                decoration: const InputDecoration(
                                    hintText: "Enter Location"),
                              ),
                              TextFormField(
                                controller: _stringB,
                                decoration: const InputDecoration(
                                    hintText: "Enter Location"),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: TextFormField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: _intA,
                                    decoration:
                                        const InputDecoration(hintText: "Hrs"),
                                  )),
                                  const Text(
                                    ":",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'))
                                    ],
                                    keyboardType: TextInputType.number,
                                    controller: _intB,
                                    decoration:
                                        const InputDecoration(hintText: "Mins"),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              var location = _location.text;
                              var stringA = _stringA.text;
                              var stringB = _stringB.text;
                              var intA = _intA.text;
                              var intB = _intB.text;

                              print("Location: " + location);
                              print("StringA: " + stringA);
                              print("stringB: " + stringB);
                              print("Hrs: " + intA);
                              print("Mins: " + intB);
                              Navigator.of(context).pop();
                              _location.clear();
                              _stringA.clear();
                              _stringB.clear();
                              _intA.clear();
                              _intB.clear();
                            },
                            child: const Text("Submit"))
                      ],
                    );
                  });
            },
            child: const Text("open dialog")),
      ),
    );
  }
}
