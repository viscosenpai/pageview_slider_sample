import 'package:flutter/material.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  final controller = PageController(initialPage: 999);
  final _kDuration = const Duration(milliseconds: 300);
  final _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: controller,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return pages[index % pages.length];
              },
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                    child: const Text('prev'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                    child: const Text('next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
