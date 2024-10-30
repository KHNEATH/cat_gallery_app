import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_logic.dart';
import 'dark_logic.dart';
import 'product_logic.dart';
import 'screen_one.dart';

Widget asyncAppWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductLogic()),
      ChangeNotifierProvider(create: (context) => CartLogic()),
      ChangeNotifierProvider(create: (context) => DarkLogic()),
    ],
    child: SplashScreen(),
  );
}

class SplashScreen extends StatelessWidget {
  // const SplashScreen({super.key});

  Future _reading(BuildContext context) async{
    await context.read<ProductLogic>().getData();
    await context.read<DarkLogic>().readCache();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<void>(
        future: _reading(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AsyncApp();
          } else {
            return _buildLoading();
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.face, size: 200),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class AsyncApp extends StatelessWidget {
  const AsyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    int themeIndex = context.watch<DarkLogic>().themeIndex;

    return MaterialApp(
      themeMode: themeIndex == 0
          ? ThemeMode.system
          : themeIndex == 1
              ? ThemeMode.dark
              : ThemeMode.light,

      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ScreenOne(),
    );
  }
}
