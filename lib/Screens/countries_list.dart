import 'dart:convert';

import 'package:covid_tracker/Screens/country_details.dart';
import 'package:covid_tracker/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  String? countryName = "";
  Future getCountriesList() async {
    var data = await http.get(Uri.parse(ApiUrl.countries));
    if (data.statusCode == 200) {
      List decodedData = jsonDecode(data.body);
      return decodedData;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.07,
          vertical: MediaQuery.sizeOf(context).height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                countryName = value;
                setState(() {});
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.sizeOf(context).width * 0.07,
                  ),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.sizeOf(context).width * 0.07,
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 1),
                ),
                hintText: "Search with country name",
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),

            Expanded(
              child: FutureBuilder(
                future: getCountriesList(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey.shade600,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.15,
                                    height:
                                        MediaQuery.sizeOf(context).height *
                                        0.06,
                                    color: Colors.white,
                                  ),
                                  title: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                            0.2,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                            0.03,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                              0.2,
                                          height:
                                              MediaQuery.sizeOf(
                                                context,
                                              ).height *
                                              0.03,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    Center(
                      child: Text(
                        "Error:${snapshot.error}",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (countryName!.isEmpty) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => CountryDetails(
                                      countryData: snapshot.data![index],
                                    ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image.network(
                              "${snapshot.data![index]["countryInfo"]["flag"]}",
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              "${snapshot.data![index]["country"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "${snapshot.data![index]["cases"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else if (snapshot.data![index]["country"]
                          .toString()
                          .toLowerCase()
                          .contains(countryName!.toLowerCase())) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => CountryDetails(
                                      countryData: snapshot.data![index],
                                    ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image.network(
                              "${snapshot.data![index]["countryInfo"]["flag"]}",
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              "${snapshot.data![index]["country"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "${snapshot.data![index]["cases"]}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
