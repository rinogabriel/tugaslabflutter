import 'package:flutter/material.dart';
// import 'second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedIndex = 0; // Untuk melacak tab yang dipilih.
  List<Widget> _tabs = []; // Daftar layar yang dibuka.
  List<String> _titles = []; // Daftar judul sesuai urutan layar.

  @override
  void initState() {
    super.initState();
    _generateTabs(2); // Generate 2 layar awal
  }

  void _generateTabs(int numberOfTabs) {
    _tabs = List.generate(numberOfTabs, (index) => FirstTab(index + 1));
    _titles = List.generate(numberOfTabs, (index) => 'Screen ${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]), // Tampilkan judul sesuai urutan layar yang dibuka.
        backgroundColor: Color.fromARGB(255, 186, 157, 13),
      ),
      body: _tabs[_selectedIndex], // Tampilkan tab yang dipilih.
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Tab 2',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  final int screenNumber;

  FirstTab(this.screenNumber);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          ElevatedButton(
            onPressed: () {
              // Kembali ke tampilan utama saat tombol "Kembali ke Tampilan Utama" ditekan.
              Navigator.pop(context);
            },
            child: Text('Kembali ke Tampilan Utama'),
          ),
        ],
      ),
    );
  }
}
