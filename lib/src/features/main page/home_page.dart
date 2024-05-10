import 'package:flutter/material.dart';
import 'package:flutter_drive/src/features/game%20over/loss.dart';
import 'package:flutter_drive/src/features/game%20over/victory_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> l = [
    const LossPage(),
    const MainPage(),
    const VictoryPage(),
  ];
  void getPage(int index) {
    setState(() {
      l;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 20, 37),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Image_logog_light.png',
              width: 330,
              height: 330,
            ),
            GestureDetector(
              child: Container(
                width: 290,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Онлайн игра',
                    style: TextStyle(
                      color: Color(0xffCA99C5),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                width: 290,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffCA99C5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Одиночная игра',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {},
            ),
            // ButtonMain(
            //   width: 80,
            //   height: 60,
            //   circularBorderRadius: 30,
            //   color: getColor(),
            //   onTap: () {
            //     setState(() {
            //       color = !color;
            //     });
            //   },
            // )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffCA99C5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.games,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
        onTap: getPage,
      ),
    );
  }
}
