import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid_apps/model/data_global.dart';
import 'package:covid_apps/services/api_covid_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final List<String> imgList = [
  'assets/images/banner-mask.jpg',
  'assets/images/social-distance.jpg',
  'assets/images/hand-sanitizer.jpg',
  'assets/images/support-medic.jpg',
  'assets/images/ayo-pakai-masker.jpeg',
  'assets/images/ayo-pakai-masker-2.jpeg',
];


class _HomeScreenState extends State<HomeScreen> {
  late Future<DataGlobal> dataIndonesia;

  @override
  void initState() {
    super.initState();
    dataIndonesia = fetchData();

    dataIndonesia.whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Informasi Seputar Covid 19',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imgList
              .map((item) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000)))
              .toList(),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Update Terkini',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Color.fromARGB(255, 44, 44, 90),
            elevation: 2.5,
            child: Column(
              children: [
                Flexible(
                    flex: 2,
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/Flag-Indonesia.jpg',
                          height: 20,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Text(
                              'Indonesia',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Colors.white),
                            )),
                      ),
                    ])),
                Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Terkonfirmasi",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber),
                                  ),
                                ),
                                FutureBuilder<DataGlobal>(
                                  future: dataIndonesia,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        NumberFormat.compact(locale: 'id')
                                            .format(snapshot.data!.confirmed),
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }

                                    // By default, show a loading spinner.
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: CircularProgressIndicator(),
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Sembuh",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ),
                                FutureBuilder<DataGlobal>(
                                  future: dataIndonesia,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        NumberFormat.compact(locale: 'id')
                                            .format(snapshot.data!.recovered),
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }

                                    // By default, show a loading spinner.
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: CircularProgressIndicator(),
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Meninggal",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                                FutureBuilder<DataGlobal>(
                                  future: dataIndonesia,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        NumberFormat.compact(locale: 'id')
                                            .format(snapshot.data!.deaths),
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }

                                    // By default, show a loading spinner.
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: CircularProgressIndicator(),
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text(
            'Kenali Gejala Umum',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 200,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/icons/002-fever.png',
                        height: 100,
                      ),
                    ),
                    Text(
                      'Demam Tinggi',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2.5,
                child: Column(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/icons/023-sore throat.png',
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        'Batuk Kering',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/icons/004-difficulty breathing.png',
                          height: 100,
                        ),
                      ),
                    ),
                    Text(
                      'Sesak Nafas',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/icons/030-headache.png',
                          height: 100,
                        ),
                      ),
                    ),
                    Text(
                      'Sakit Kepala',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2.5,
                child: Column(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/icons/032-loss of sense of smell.png',
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Kehilangan Indra Penciuman',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/icons/005-loss of sense of taste.png',
                          height: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Kehilangan Indra Perasa',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 2.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/icons/007-skin rash.png',
                          height: 100,
                        ),
                      ),
                    ),
                    Text(
                      'Ruam Pada Kulit',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    )
                  ],
                ),
              ),
            ]))
      ],
    );
  }
}
