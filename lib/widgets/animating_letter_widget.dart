import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/letter_generator.dart';

class AnimatingLetterWidget extends StatefulWidget {
  final String letter;
  final double size;
  const AnimatingLetterWidget(
      {super.key, required this.letter, this.size = 15});

  @override
  State<AnimatingLetterWidget> createState() => _AnimatingLetterWidgetState();
}

class _AnimatingLetterWidgetState extends State<AnimatingLetterWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late String letter;
  ValueNotifier<bool> animationnotifier = ValueNotifier(false);
  @override
  void initState() {
    letter = widget.letter;
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 'e'.codeUnitAt(0) * 20),
        animationBehavior: AnimationBehavior.normal);
    animation = IntTween(begin: 65, end: letter.codeUnitAt(0)).animate(
        controller
          ..duration = Duration(milliseconds: letter.codeUnitAt(0) * 20));
    // animation.addStatusListener(
    //   (status) {
    //     status.isCompleted?animationnotifier.value=true:false;
    //   },
    // );
    controller.addStatusListener(
      (status) {

        status.isCompleted ? animationnotifier.value = true : false;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        controller.forward();
        String char = generateLetterFromAsccii(animation.value);
        return ValueListenableBuilder(
            valueListenable: animationnotifier,
            builder: (context, value, _) {
              return Text(letter == ' ' ? ' ' : char,
                  style: GoogleFonts.zillaSlab(
                      color: value ? Colors.amber : Colors.white,
                      fontSize: widget.size,
                      fontWeight: FontWeight.bold));
            });
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
