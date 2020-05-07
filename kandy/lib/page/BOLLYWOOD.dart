import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kandy/TV/tvshow.dart';
import 'package:kandy/details/tvdetails.dart';
import 'package:kandy/homescreen/Drawer.dart';

import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class BOLLYWOOD extends StatefulWidget {
  BOLLYWOOD({Key key}) : super(key: key);

  @override
  _BOLLYWOODState createState() => _BOLLYWOODState();
}

class _BOLLYWOODState extends State<BOLLYWOOD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BOLLYWOODpage(),
    );
  }
}

class BOLLYWOODpage extends StatefulWidget {
  BOLLYWOODpage({Key key}) : super(key: key);

  @override
  _BOLLYWOODpageState createState() => _BOLLYWOODpageState();
}

class _BOLLYWOODpageState extends State<BOLLYWOODpage> {
  Future _data;
  Future getBOLLYWOOD() async {
    var firestore = Firestore.instance;
    QuerySnapshot gh = await firestore.collection('BOLLYWOOD').getDocuments();
    return gh.documents;
  }

  navigatetotvdetails(DocumentSnapshot tv) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Tvdetails(tv: tv)));
  }

  @override
  void initState() {
    super.initState();
    _data = getBOLLYWOOD();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(
                      child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.redAccent[700]),
                  )));
            else {
              return Scaffold(
                drawer: Drawers(),
                appBar: AppBar(
                  actions: <Widget>[
                     IconButton(
                        icon: Icon(
                          Icons.tv,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tvshow()),
                          );
                        }),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null)
                  ],
                  centerTitle: true,
                  title: SizedBox(
                      height: 50.0,
                      child: Image.asset('images/Netflix-logo.png')),
                  backgroundColor: Colors.black,
                ),
                backgroundColor: Colors.black,
                body: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child:  Column(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 5,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                        ),
                                        InkWell(
                                          onTap: () => launch(
                                              snapshot.data[index].data['aa']),
                                          child: Container(
                                            child: Image.network(
                                              snapshot.data[index].data['a'],
                                              fit: BoxFit.fill,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.5,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                        ),
                                        InkWell(
                                          onTap: () => launch(
                                              snapshot.data[index].data['bb']),
                                          child: Container(
                                            child: Image.network(
                                              snapshot.data[index].data['b'],
                                              fit: BoxFit.fill,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.5,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                        ),
                                        InkWell(
                                          onTap: () => launch(
                                              snapshot.data[index].data['cc']),
                                          child: Container(
                                            child: Image.network(
                                              snapshot.data[index].data['c'],
                                              fit: BoxFit.fill,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.5,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                        ),
                                        InkWell(
                                          onTap: () => launch(
                                              snapshot.data[index].data['dd']),
                                          child: Container(
                                            child: Image.network(
                                              snapshot.data[index].data['d'],
                                              fit: BoxFit.fill,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.5,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}
