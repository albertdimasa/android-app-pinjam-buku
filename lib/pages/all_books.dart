import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinjambuku/widget/bookcard.dart';
import 'package:pinjambuku/widget/widget.dart';

class AllBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference books = firestore.collection('books');

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

              //Search Box
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
              SizedBox(
                height: 20,
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
                                    (books.doc(e.id).toString()),
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
              child: IconButton(
                icon: Image.asset("assets/Icon/ic_baseline-dashboard.png"),
                tooltip: 'Dashboard',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
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
