import 'package:flutter/material.dart';
import 'package:pinjambuku/widget/widget.dart';

class SingleProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  //Icon Back
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(28, 40, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          child: Image(
                              image: AssetImage(
                                  'assets/Icon/eva_arrow-ios-back-fill.png')),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            //Image
                            Container(
                              height: 170,
                              width: 111,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/Cover_Buku/03.jpg')),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                            //Information
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text('Pulang', style: bookTitle3),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child:
                                        Text('Tere Liye', style: authorTitle),
                                  ),
                                  SizedBox(height: 25),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Text('4.5', style: otherTitle),
                                            Image(
                                                image: AssetImage(
                                                    'assets/Icon/Star.png')),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.deepOrange.shade400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text('5x dipinjam', style: authorTitle)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, top: 15),
                          child: Column(
                            children: [
                              Text(
                                'Sinopsis',
                                style: bookTitle2,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Novel ini menceritakan kisah seorang anak laki-laki bernama Bujang yang tinggal di dasar rimba Sumatra bersama Samad dan Midah, kedua orang tuanya. Hidupnya sederhana, sama seperti anak kecil pada umumnya. Hingga kedatangan rombongan Tauke Besar untuk berburu menjadi awal perubahan hidupnya.',
                                style: textNormal,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 25, 5),
                          child: Text(
                            'Pemilik Buku',
                            style: bookTitle2,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Profil/profil.png')),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dimas Albert Abraham',
                                    style: bookTitle2,
                                  ),
                                  Text(
                                    'Informatika',
                                    style: authorTitle,
                                  ),
                                  Container(
                                    child: Text(
                                      'Lihat Profil',
                                      style: textNormal,
                                    ),
                                    height: 20,
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade400,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Row(children: [
              Container(
                child: Center(child: Text('Pinjam Buku', style: bookTitle2)),
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
              ),
            ])));
  }
}
