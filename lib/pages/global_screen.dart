import 'package:covid_apps/model/data_global.dart';
import 'package:covid_apps/model/list_global.dart';
import 'package:covid_apps/services/api_covid_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  late Future<DataGlobal> futureglobalData;
  late Future<List<ListGlobal>> futureListglobalData;

  @override
  void initState() {
    super.initState();
    futureListglobalData = fetchListData();

    futureListglobalData.whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListGlobal>>(
      future: futureListglobalData,
      builder: (context, snapshot) {
        var globalData = snapshot.data;
        if (snapshot.hasData) {
          return ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'Data Global',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: HexColor('#b33939'),
                              elevation: 2.5,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Kasus Aktif',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        NumberFormat.compact(locale: 'id')
                                            .format(globalData![0].active),
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: HexColor('#009432'),
                              elevation: 2.5,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Kasus Harian',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        NumberFormat.compact(locale: 'id')
                                            .format(globalData[0].todayCases),
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color.fromARGB(255, 44, 44, 90),
                    elevation: 2.5,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Terkonfirmasi",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    NumberFormat("#,###")
                                        .format(globalData[0].cases),
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Sembuh',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      NumberFormat("#,###")
                                          .format(globalData[0].recovered),
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Meninggal',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      NumberFormat("#,###")
                                          .format(globalData[0].deaths),
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ])),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  'Statistik',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2.5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Lokasi',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          color: HexColor('#2980b9'),
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Positif',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: HexColor('#d35400'),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Sembuh',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Meninggal',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: globalData.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                          "${globalData[index].country}",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 12,
                                                color: HexColor('#2980b9'),
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            NumberFormat.compact(locale: 'id')
                                                .format(
                                                    globalData[index].cases),
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: HexColor('#d35400'),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            NumberFormat.compact(locale: 'id')
                                                .format(globalData[index]
                                                    .recovered),
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            NumberFormat.compact(locale: 'id')
                                                .format(
                                                    globalData[index].deaths),
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(50),
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
