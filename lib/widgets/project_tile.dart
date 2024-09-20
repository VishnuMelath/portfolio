import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final String thumpnail;
  final List<String> screenshots;
  final String title;
  final String description;
  final List<String> techs;
  const ProjectTile({super.key, required this.thumpnail, required this.screenshots, required this.title, required this.description, required this.techs});

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration:const Duration(microseconds: 200),
      child: Column(
        children: [ 
          Image.asset(thumpnail)
        ],
      ),
    );
  }
}