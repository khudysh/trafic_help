import 'package:flutter/material.dart';
import 'package:help/freqdist_controller.dart';
import 'package:help/freqdist_model.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FreqDist extends StatefulWidget {
  FreqDist({Key? key}) : super(key: key);

  @override
  State<FreqDist> createState() => _FreqDistState();
}

class _FreqDistState extends State<FreqDist> {
  String date = "";
  DateTime selectedDate = DateTime.parse('2022-05-19 00:00:00Z');
  HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: Container(), leadingWidth: 0, title: const Center(child: Text("Частотное распределение видов ТС"))),

        body:
    ResponsiveGridRow(children: [
      ResponsiveGridCol(
        xs: 12,
        md: 2,
        child: Container(
          alignment: Alignment(0, 0),
          color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.indigo),
                  child: Text("Выбор даты"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/choose'),
                  style: ElevatedButton.styleFrom(primary: Colors.indigo),
                  child: Text("Назад к выбору отчета"),
                ),
              ),
            ],
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 12,
        md: 8,
        child: Container(
          alignment: Alignment(0, 0),
          child: Column(children: [
            Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: Align(
                    alignment: Alignment.topCenter,
                    //check if data is loaded, if loaded then show datalist on child
                    child: Table(
                      border:
                          TableBorder.all(width: 2, color: Colors.black45),
                      children: const [
                        TableRow(children: [
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "ID",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                )),
                          )),
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Тип ТС",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                )),
                          )),
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Кол-во распознанных",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                )),
                          )),
                          TableCell(
                              child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "Относительная частота (~%)",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                )),
                          )),
                        ])
                      ],
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Align(
                alignment: Alignment.topCenter,
                //check if data is loaded, if loaded then show datalist on child
                child: FutureBuilder(
                  future: httpService.getFreqDist(
                      "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<FreqDistData>> snapshot) {
                    if (snapshot.hasData) {
                      List<FreqDistData> tableunits = snapshot.data!;
                      return Table(
                        //if data is loaded then show table
                        border:
                            TableBorder.all(width: 2, color: Colors.black45),
                        children: tableunits.map(
                          (unit) {
                            return TableRow(//return table row in every loop
                                children: [
                              //table cells inside table row
                              TableCell(
                                  child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      unit.id,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          decoration: TextDecoration.none),
                                    )),
                              )),
                              TableCell(
                                  child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      unit.vehicle_type,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          decoration: TextDecoration.none),
                                    )),
                              )),
                              TableCell(
                                  child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      unit.count,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          decoration: TextDecoration.none),
                                    )),
                              )),
                              TableCell(
                                  child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      unit.freq_dist,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          decoration: TextDecoration.none),
                                    )),
                              )),
                            ]);
                          },
                        ).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
      ResponsiveGridCol(
        xs: 0,
        md: 2,
        child: Container(
          alignment: Alignment(0, 0),
          color: Colors.white,
        ),
      ),
    ]));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
