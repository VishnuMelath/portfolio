import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/screens/homepage.dart';
import 'package:portfolio/utils/animated_routing.dart';
import 'package:portfolio/widgets/animating_letter_widget.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> visible = ValueNotifier(false);
    int timer=0;
    return customScaffold(
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: value,
                child: TextButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                Navigator.push(context, createRoute(const Homepage()));
              }, child:const Text('let\'s go'))),
            );
            },)
          ],
        ),
      ),
    );
  }
}
