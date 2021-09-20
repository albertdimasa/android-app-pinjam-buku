import 'package:flutter/material.dart';
import 'package:pinjambuku/pages/single_product.dart';
import 'package:pinjambuku/widget/widget.dart';

class BookCard extends StatelessWidget {
  final cover;
  final String judul;
  final String penulis;
  final id;

  BookCard(this.cover, this.judul, this.penulis, this.id);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleProduct()),
            );
          },
          child: Container(
            height: 129,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(cover),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              shape: BoxShape.rectangle,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          judul,
          style: bookTitle2,
        ),
        Text(
          penulis,
          style: authorTitle,
        ),
      ],
    );
  }
}
