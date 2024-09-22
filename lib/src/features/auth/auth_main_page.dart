import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/src/routes/routes.dart';

@RoutePage()
class AouthMainPage extends StatefulWidget {
  const AouthMainPage({super.key});

  @override
  State<AouthMainPage> createState() => _AouthMainPageState();
}

class _AouthMainPageState extends State<AouthMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 20, 37),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Авторизация',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
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
                    'Войти',
                    style: TextStyle(
                      color: Color(0xffCA99C5),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {
                AutoRouter.of(context).push(
                  const LogInRoute(),
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'ИЛИ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
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
                    'Зарегистрироваться',
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
                  const SignUpRoute(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
