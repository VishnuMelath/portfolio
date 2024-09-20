import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';


Widget customScaffold({required Widget body,AppBar? appBar})
{
  return Container(
    color: backgroundColor,
    child:  SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: body,
      ),
    ),
  );
}