import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  final Map<String, dynamic>? countryData;
  const CountryDetails({required this.countryData, super.key});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Card(
                    color: Colors.grey.shade800,
                    child: Column(
                      children: [
                  
                        ListTilWidget(
                          name: "cases",
                          number: widget.countryData!["cases"].toString(),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        ListTilWidget(
                          name: "Recovered",
                          number: widget.countryData!["recovered"].toString(),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        ListTilWidget(
                          name: "Deaths",
                          number: widget.countryData!["deaths"].toString(),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        ListTilWidget(
                          name: "Critical",
                          number: widget.countryData!["critical"].toString(),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        ListTilWidget(
                          name: "TodayRecovered",
                          number: widget.countryData!["todayRecovered"].toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(backgroundImage: NetworkImage("${widget.countryData!["countryInfo"]["flag"]}"),radius: 60,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListTilWidget extends StatelessWidget {
  final String name;
  final String number;
  const ListTilWidget({required this.name, required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(name, style: TextStyle(color: Colors.white,fontSize: 17)),
      trailing: Text(number, style: TextStyle(color: Colors.white,fontSize: 17)),
    );
  }
}
