import 'package:flutter/material.dart';

ThemeData theme({dark=false}){
  return ThemeData(
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue,brightness: dark ? Brightness.dark : Brightness.light),
    useMaterial3: true,
  );
}

AppBarTheme appBarTheme(){
  return const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xff8b8b8b)),
  );
}
