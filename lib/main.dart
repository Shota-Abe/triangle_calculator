import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
  double height = 0;
  double base = 0;

  TextEditingController heightController = TextEditingController();
  TextEditingController baseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text(
              "Calculator",
              style: const TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            backgroundColor: Colors.grey[900],
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Height :",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Base :",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: baseController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      child: const Text("Calculate",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          height = double.parse(heightController.value.text);
                          base = double.parse(baseController.value.text);
                        });
                        calculate(height, base);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Area",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      result,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void calculate(double height, double base) {
    double finalresult = base * height / 2;
    String area = finalresult.toStringAsFixed(2);
    setState(() {
      result = area;
    });
  }
}
