import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var count = 0;
  var emoji = '😐';
  int bgC = 500;
  double bgR = 50;

  void plus() {
    setState(() {
      if (count < 5) {
        count++;
      }
      update();
    });
  }

  void minus() {
    setState(() {
      if (count > -5) {
        count--;
      }
      update();
    });
  }

  void update(){
    setState(() {
      if (count == 0){
        emoji = '😐';
        bgC = 500;
        bgR = 50;
      }else if (count == 2){
        emoji = '😄';
        bgC = 700;
        bgR = 70;
      }else if (count == 5){
        emoji = '🤩';
        bgC = 900;
        bgR = 100;
      }else if (count == -2){
        emoji = '😞';
        bgC = 300;
        bgR = 30;
      }else if (count == -5){
        emoji = '😫';
        bgC = 100;
        bgR = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            fontFamily: 'new',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.red[100],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red[bgC],
                borderRadius: BorderRadius.circular(bgR),
              ),
              child: Text('${emoji}', style: TextStyle(fontSize: 100)),
            ),
            Text(
              '-5 to +5',
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '${count}',
              style: TextStyle(
                color: Colors.red[900],
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => minus(),
            tooltip: 'minus',
            backgroundColor: Colors.white,
            foregroundColor: Colors.red[800],
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => plus(),
            tooltip: 'plus',
            backgroundColor: Colors.red[800],
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
