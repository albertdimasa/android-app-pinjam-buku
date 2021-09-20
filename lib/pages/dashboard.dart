import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinjambuku/pages/all_books.dart';
import 'package:pinjambuku/widget/bookcard.dart';
import 'package:pinjambuku/widget/widget.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Query<Map<String, dynamic>> books = firestore.collection('books').limit(3);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Logo
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Image(
                  image: AssetImage(
                    'assets/Icon/Logo_Small.png',
                  ),
                  width: 200,
                ),
              ),
              //Search
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 0, 27, 10),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/Icon/feather_search.png'),
                        ),
                        Text('   cari buku apa nih?', style: search),
                      ],
                    ),
                  ),
                  //Box search
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey[400],
                  ),
                ),
              ),
              //Kategori dan lihat semua
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kategori',
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Text('Lihat semua', style: otherTitle)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //Kategori Buku
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Box 1
                  Container(
                    height: 88,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('assets/Genre/art.png'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                      ),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Seni',
                        style: bookTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  //Box 2
                  Container(
                    height: 88,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('assets/Genre/Motivasi.png'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                      ),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Motivasi',
                        style: bookTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  //Box 3
                  Container(
                    height: 88,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('assets/Genre/anak.png'),
                        fit: BoxFit.fill,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                      ),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Anak',
                        style: bookTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),

              //Buku Terbaru dan Lihat semua
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Buku Terbaru',
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllBooks()),
                        );
                      },
                      child: new Text('Lihat semua', style: otherTitle)),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Scrollbar(
                child: FutureBuilder<QuerySnapshot>(
                    future: books.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Wrap(
                          spacing: 25,
                          children: snapshot.data!.docs
                              .map((e) => BookCard(
                                    (e.data() as dynamic)['cover'].toString(),
                                    (e.data() as dynamic)['judul'].toString(),
                                    (e.data() as dynamic)['penulis'].toString(),
                                    ((e.id)),
                                  ))
                              .toList(),
                        );
                      } else {
                        return Text('Loading');
                      }
                    }),
              ),
            ],
          ),
        ),

        //Bottom Menu
        bottomNavigationBar: Row(
          children: <Widget>[
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30))),
              child: new Image.asset("assets/Icon/ic_baseline-dashboard.png"),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(color: Colors.black12),
              child: new Image.asset("assets/Icon/bi_save2-fill.png"),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(color: Colors.black12),
              child: new Image.asset(
                  "assets/Icon/akar-icons_circle-plus-fill.png"),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(color: Colors.black12),
              child: new Image.asset("assets/Icon/ant-design_book-filled.png"),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20))),
              child: IconButton(
                icon: Image.asset("assets/Icon/ic_round-account-circle.png"),
                tooltip: 'Dashboard',
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
