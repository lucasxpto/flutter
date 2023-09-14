import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);

  void _gerarNumeroAleatorio() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
        valorAleatorio.value = Random().nextInt(1000);
    }

  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valorAleatorio, builder: (_, value, __) =>
               Text('O Valor é $value'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _gerarNumeroAleatorio,
             child: Text('run'),
             ),
          ],
          
        ),
      ),
    );
  }
}