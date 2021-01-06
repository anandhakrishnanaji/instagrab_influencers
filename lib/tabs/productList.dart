import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map> posts = [];

  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                    ShowProductDetailsPage.routeName,
                    arguments: posts[index]['id']);
              },
              isThreeLine: true,
              contentPadding: EdgeInsets.all(5),
              leading: ClipRRect(
                  child: Image.network(
                    posts[index]['image320'],
                    //height: 0.5 * height,
                    //width: 0.25 * width,
                    //fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10), bottom: Radius.circular(10))),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  posts[index]['name'],
                ),
              ),
              subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "₹ ${posts[index]['offer_price']}",
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          "₹ ${posts[index]['actual_price']}",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.pink),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        posts[index]['rating'] == null
                            ? Text('Not Rated')
                            : Row(
                                children: [
                                  Text("${posts[index]['rating']}"),
                                  Icon(
                                    Icons.star,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
                                  )
                                ],
                              ),
                        Text("${posts[index]['order_count']} Orders")
                      ],
                    )
                  ]),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          );
        },
      ),
    );
  }
}
