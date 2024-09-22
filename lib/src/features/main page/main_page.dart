import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/src/routes/routes.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageRouteInfo<dynamic> l = const LossRoute();

  void getPage(int index) {
    setState(() {
      AutoRouter.of(context).push(l);
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
                    'Онлайн рисование',
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
                    'Одиночное рисование',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {
                AutoRouter.of(context).push(
                  const DrawingBoardRoute(),
                );
              },
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
        // onTap: getPage,
      ),
    );
  }
}
