import 'dart:convert';

import 'package:covid_tracker/Model/coviddataall.dart';
import 'package:covid_tracker/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool syncCall = true;

  Future<Coviddataall> getAllData() async {
    var data = await http.get(Uri.parse(ApiUrl.all));
    var decodedData = jsonDecode(data.body);
    if (data.statusCode == 200) {
      syncCall = false;
      return Coviddataall.fromJson(decodedData);
    } else {
      syncCall = false;
      return Coviddataall.fromJson(decodedData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: FutureBuilder(
          future: getAllData(),
          builder: (context, snapshot) {
            return (syncCall)
                ? Expanded(child: SpinKitCircle(color: Colors.white,))
                : Column(
                  children: [
                    PieChart(
                      dataMap: {
                        "Total": (snapshot.data?.cases)?.toDouble() ?? 0,
                        "Recovered":
                            (snapshot.data?.recovered)?.toDouble() ?? 0,
                        "Deaths": (snapshot.data?.deaths)?.toDouble() ?? 0,
                      },
                      chartRadius: MediaQuery.of(context).size.width * 0.4,
                      animationDuration: Duration(seconds: 1),
                      legendOptions: LegendOptions(
                        legendPosition: LegendPosition.left,
                        legendTextStyle: TextStyle(color: Colors.white),
                      ),
                      chartType: ChartType.ring,
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Card(
                      color: Colors.grey.shade700,
                      shadowColor: Colors.grey.shade300,
                      surfaceTintColor: Colors.grey.shade900,
                      elevation: 3,
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          RowText(
                            textname: "Total",
                            textvalue: "${(snapshot.data?.cases) ?? 0}",
                          ),
                          RowText(
                            textname: "Deaths",
                            textvalue: "${(snapshot.data?.deaths) ?? 0}",
                          ),
                          RowText(
                            textname: "Recovered",
                            textvalue: "${(snapshot.data?.recovered) ?? 0}",
                          ),
                          RowText(
                            textname: "Active",
                            textvalue: "${(snapshot.data?.active) ?? 0}",
                          ),
                          RowText(
                            textname: "Critical",
                            textvalue: "${(snapshot.data?.critical) ?? 0}",
                          ),
                          RowText(
                            textname: "Today Deaths",
                            textvalue: "${(snapshot.data?.todayDeaths) ?? 0}",
                          ),
                          RowText(
                            textname: "Today Recovered",
                            textvalue:
                                "${(snapshot.data?.todayRecovered) ?? 0}",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Track Countries",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                );
          },
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final String? textname;
  final String? textvalue;
  const RowText({required this.textname, required this.textvalue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: Text("$textname", style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: Text("$textvalue", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
