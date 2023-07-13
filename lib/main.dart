import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late AnimationController animCtrl;
  late Animation anim;
  late Animation animColor;

  @override
  void initState() {
    super.initState();

    animCtrl = AnimationController(vsync: this, duration: Duration(seconds: 4));
    anim = Tween(begin: 0.0, end: 200.0).animate(animCtrl);
    animColor = ColorTween(begin: Colors.deepPurpleAccent, end: Colors.pinkAccent).animate(animCtrl);

    animCtrl.addListener(() {
      print(anim.value);
      setState(() {});
    });
    animCtrl.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: anim.value,
          width: anim.value,
          color: animColor.value,
        ),
      )
    );
  }
}

