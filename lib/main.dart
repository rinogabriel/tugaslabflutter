import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart'; 
import 'third_screen.dart'; 

void main() {
  runApp(MaterialApp(
    title: 'Screen Selection',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ScreenSelection(),
  ));
}

class ScreenSelection extends StatefulWidget {
  @override
  _ScreenSelectionState createState() => _ScreenSelectionState();
}

class _ScreenSelectionState extends State<ScreenSelection> {
  int _selectedScreen = 0;
  List<Widget> screens = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateScreens(3); // menambahkan 3 layar yang sudah ada
  }

  void _generateScreens(int number) {
    screens.clear();
    for (int i = 0; i < number; i++) {
      if (i == 1) {
        screens.add(SecondScreen()); // menambahkan screen kedua 
      } else if (i == 2) {
        screens.add(ThirdScreen()); // menambahkan screen ketiga
      } else {
        screens.add(FirstScreen()); // menambahkan screen pertama
      }
    }
    setState(() {}); // mentriger widget
  }

  void _navigateToSelectedScreen() {
    if (_selectedScreen >= 0 && _selectedScreen < screens.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screens[_selectedScreen],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukan Berapa Screen Untuk Di Generate',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int number = int.tryParse(_controller.text) ?? 0;
                _generateScreens(number);
              },
              child: Text('Buat Screen'),
            ),
            SizedBox(height: 16),
            if (screens.isNotEmpty)
              DropdownButton<int>(
                value: _selectedScreen,
                items: List.generate(
                  screens.length,
                  (index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text('Screen $index'),
                    );
                  },
                ),
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedScreen = newValue!;
                  });
                },
              ),
            SizedBox(height: 16),
            if (screens.isNotEmpty)
              ElevatedButton(
                onPressed: _navigateToSelectedScreen,
                child: Text('Masuk Ke Screen Yang Dipilih'),
              ),
          ],
        ),
      ),
    );
  }
}
