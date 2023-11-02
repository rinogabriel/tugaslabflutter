import 'package:flutter/material.dart';
import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Color.fromARGB(255, 227, 140, 17),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the third screen.
            Navigator.pushNamed(context, '/third');
          },
          
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 199, 79, 9),
          ),
          child: Text(
            'Pergi ke Screen ke-3',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
