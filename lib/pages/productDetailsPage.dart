import 'package:flutter/material.dart';
import 'package:instagrab_influencers/widgets/smallBox.dart';

class Proddeta extends StatelessWidget {
  static const routeName = '/showProductDetails';

  @override
  Widget build(BuildContext context) {
    Map prodDetails = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              color: Colors.green,
              child: Image.network(
                prodDetails['image320'],
                fit: BoxFit.cover,
              )),
          Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              child: Align(
                child: Text(
                  prodDetails['name'],
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
          Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc porttitor posuere nibh, eu volutpat erat aliquet non. Curabitur vehicula pretium nisl ac tincidunt. Nulla euismod. ',
                  style: TextStyle(fontSize: 19),
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: Container(
          color: Colors.red,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'View More',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          )),
    );
  }
}
