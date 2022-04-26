import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizateam/quiz_app/quiz_page/quiz_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Get.to(()=> QuizPage()), child: const Text('Quiz App')),
            ElevatedButton(onPressed: () {

            }, child: const Text('Reminder App')),
          ],
        ),
      ),
    );
  }
}




