import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<Map> posts = [];

  Widget build(BuildContext context) {
    // print(posts);
    return Container(
      //color: Colors.white,
      child: Stack(
        children: <Widget>[
          posts.isEmpty
              ? Center(
                  child: Text(
                    'No Orders found',
                    style: GoogleFonts.openSans(
                        color: Colors.grey[700], fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return OrderTile(
                      url: posts[index]['image320'],
                      customerName: posts[index]['customer_name'],
                      date: posts[index]['date'].toString(),
                      productName: posts[index]['product_name'],
                      price: posts[index]['total'].toString(),
                      status: posts[index]['status'],
                      ontap: () {
                        Navigator.of(context)
                            .pushNamed(OrderDetailsPage.routeName, arguments: {
                          'id': posts[index]['id'],
                          'callback': (value) {
                            print(value);
                            if (value != posts[index]['status'])
                              setState(() {
                                posts[index]['status'] = value;
                              });
                          }
                        });
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}
