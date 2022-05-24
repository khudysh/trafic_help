import 'package:flutter/material.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: Container(), leadingWidth: 0, title: Center(child: Text("Выбор экрана отчета"))),

        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 400.0,
                      height: 50.0,
                      child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/freq_dist'),
                          child: Text("Частотное распределение", style: TextStyle(fontSize: 20),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 400.0,
                      height: 50.0,
                      child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/rates'),
                          child: Text("Загруженность трафика", style: TextStyle(fontSize: 20),)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
