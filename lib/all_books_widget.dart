import 'package:flutter/material.dart';

class BooksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.red,
        );
      },
      // children: [
      //   Container(
      //     height: 129,
      //     width: 88,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10),
      //       image: DecorationImage(
      //         image: AssetImage('assets/Cover_Buku/01.jpg'),
      //         fit: BoxFit.fill,
      //       ),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.8),
      //           spreadRadius: 0,
      //           blurRadius: 2,
      //           offset: Offset(0, 2), // changes position of shadow
      //         ),
      //       ],
      //       shape: BoxShape.rectangle,
      //     ),
      //   ),
      //   SizedBox(
      //     height: 10,
      //   ),
      //   Text(
      //     'Selena',
      //     style: bookTitle2,
      //   ),
      //   Text(
      //     'Tere Liye',
      //     style: authorTitle,
      //   ),
      // ],
    );
  }
}
