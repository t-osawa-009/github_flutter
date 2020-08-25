import 'package:flutter/material.dart';
import 'package:github_flutter/views/home_screen.dart';
import 'package:github_flutter/views/home_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: StateNotifierProvider<HomeStateNotifier, HomeState>(
        create: (_) => HomeStateNotifier(),
        child: HomeScreen(),
      ),
    );
  }
}
