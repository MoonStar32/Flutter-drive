import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LossPage extends StatelessWidget {
  const LossPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 254, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Loss",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 146, 188),
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
                  onPressed: () {},
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
