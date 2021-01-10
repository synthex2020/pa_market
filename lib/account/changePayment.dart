import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Change Payment")
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Payment Options",
                      style: TextStyle(
                        fontSize: 20.0,
                      )
                  ),
                ),
                RadioListTile(
                  value: 0,
                  title: Text("Mobile Money"),
                  subtitle: Text("**** 1234"),
                  secondary: Image(image: AssetImage('images/visa.png')),
                ),
                RadioListTile(
                  value: 0,
                  title: Text("Visa"),
                  subtitle: Text("**** 1234"),
                  secondary: Image(image: AssetImage('images/visa.png')),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new ElevatedButton(
                      child: new Text('Edit'),
                      onPressed: null,
                    ),
                    new ElevatedButton(
                      child: new Text('Add New Card'),
                      onPressed: null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}