import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String Unit1 = 'Kilogram';
  String Unit2 = 'Gram';
  dynamic textFieldValue = '0.0';
  double textField = 0.0;
  double result = 0.0;

  convert() {
    setState(() {
      textField = double.parse(textFieldValue);
      if (Unit1 == 'Kilogram' && Unit2 == 'Gram') {
        result = textField * 1000;
      } else if (Unit1 == 'Gram' && Unit2 == 'Kilogram') {
        result = textField / 1000;
      } else {
        result = textField;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.teal[300],
          centerTitle: true,
          title: Text(
            "Measures Converter",
            style: TextStyle(color: Colors.white, fontFamily: "Lobster"),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Image(
                image: AssetImage("asset/images/1.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                onChanged: (text) {
                  textFieldValue = text;
                  convert();
                  focusNode:
                  FocusNode(canRequestFocus: false);
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // icon: Icon(Icons.input),
                  labelText: "value",
                  labelStyle: TextStyle(
                    color: Colors.orangeAccent[100],
                    letterSpacing: 3,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  style: TextStyle(
                    color: Colors.orangeAccent[100],
                  ),
                  value: Unit1,
                  items: [
                    DropdownMenuItem(
                      child: Text('Kilogram'),
                      value: 'Kilogram',
                    ),
                    DropdownMenuItem(
                      child: Text('Gram'),
                      value: 'Gram',
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      Unit1 = val;
                      convert();
                    });
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.compare_arrows,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                DropdownButton(
                  style: TextStyle(
                    color: Colors.orangeAccent[100],
                  ),
                  value: Unit2,
                  items: [
                    DropdownMenuItem(
                      child: Text('Kilogram'),
                      value: 'Kilogram',
                    ),
                    DropdownMenuItem(
                      child: Text('Gram'),
                      value: 'Gram',
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      Unit2 = val;
                      convert();
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              onPressed: convert(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Convert",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 20,
                      letterSpacing: 2),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$textField $Unit1 is $result $Unit2',
              style: TextStyle(
                  color: Colors.grey[500], fontSize: 16, fontFamily: "Roboto"),
            ),
          ],
        ),
      ),
    );
  }
}
