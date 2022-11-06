import 'package:flutter/material.dart';
import 'package:hahaaa/stateful_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData darkTheme = ThemeData.dark();
  ThemeData lightTheme = ThemeData.light();
  bool? isDarkMode;
  Future<void> func(bool _isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    setState(() {
      isDarkMode = _isDarkMode;
    });
  }

  Future<void> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isDarkMode;
    getSharedPrefs();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home:isDarkMode == null? const CircularProgressIndicator(): MyStatefulWidget(func: func, isDarkMode: isDarkMode!),
    );
  }
  ThemeData getTheme(){
    if(isDarkMode == null){
      return lightTheme;
    }
    else if(isDarkMode == true){
      return darkTheme;
    }
    else{
      return lightTheme;
    }

  }
}
