import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/animating_letter_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> visible = ValueNotifier(false);
    int timer=0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 52, 90),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...('VISHNU M'.split('').map(
                  (e) {
                    int timer1 = e.codeUnitAt(0) * 20;
                    timer1 > timer ? timer = timer1 : null;
                    return AnimatingLetterWidget(
                      letter: e,
                      size: 40,
                    );
                  },
                ))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...('FLUTTER DEVELOPER'.split('').map(
                  (e) {
                    int timer1 = e.codeUnitAt(0) * 20;
                    timer1 > timer ? timer = timer1 : null;
                    return AnimatingLetterWidget(
                      letter: e,
                      size: 20,
                    );
                  },
                ))
              ],
            ),
            ValueListenableBuilder(valueListenable: visible, builder: (context, value, child) {
            Timer(Duration(milliseconds: timer),() {
              visible.value=true;
            }, );
            return Visibility(child: ElevatedButton(onPressed: () {
              
            }, child:const Text('show more')));
            },)
          ],
        ),
      ),
    );
  }
}
