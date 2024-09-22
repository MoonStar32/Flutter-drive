import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/src/routes/routes.dart';

@RoutePage()
class VictoryPage extends StatelessWidget {
  const VictoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 254, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Victory",
              style: TextStyle(
                color: Color.fromARGB(255, 146, 255, 150),
                fontSize: 60,
                fontFamily: 'Anton',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).push(
                      const MainRoute(),
                    );
                  },
                  child: const Text('Вернуться на главную'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Играть снова'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
