import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        backgroundColor: Color.fromARGB(255, 186, 157, 13),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            // Navigate to the second screen.
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 900),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(255, 178, 167, 9),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Pergi ke Screen Ke-2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
