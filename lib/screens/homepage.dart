import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return customScaffold(body:  Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.white,
      ),
    ));
  }
}

