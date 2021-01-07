import 'package:flutter/material.dart';
import 'package:instagrab_influencers/widgets/smallBox.dart';

class ShowProductDetailsPage extends StatelessWidget {
  static const routeName = '/showProductDetails';

  @override
  Widget build(BuildContext context) {
    Map prodDetails = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.green,
                child: Image.network(
                  prodDetails['image'],
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
            Column(
              children: [
                SmallBox(
                  title: "Product Type",
                  value: prodDetails['product_type_name'].toString(),
                ),
                SmallBox(
                  title: "Offer Price",
                  value: prodDetails['offer_price'].toString(),
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                SmallBox(
                  title: "Actual Price",
                  value: prodDetails['actual_price'].toString(),
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                SmallBox(
                  title: "Discount",
                  value: (((double.parse(prodDetails['actual_price']) -
                                      double.parse(
                                          prodDetails['offer_price'])) /
                                  double.parse(prodDetails['offer_price'])) *
                              100)
                          .toStringAsFixed(0) +
                      "%",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                Divider(),
                SmallBox(
                  title: "Flavour",
                  value: prodDetails['flavour']['flavour'],
                ),
                Divider(),
                SmallBox(
                  title: "Is Egless",
                  value: prodDetails['is_eggless'] ? "Yes" : "No",
                ),
                Divider(),
                SmallBox(
                  title: "Average Rating",
                  value: prodDetails['product_rating'] != null
                      ? prodDetails['product_rating']
                      : 'Not Rated',
                ),
                SmallBox(
                  title: "Preparation Time",
                  value: prodDetails['preparation_time'],
                ),
                SmallBox(
                  title: "Ocassions",
                  value: 'hi',
                ),
                Divider(),
              ],
            ),
            // ProductDetailsContainer(
            //   prodDetails['product_type_name'],
            //   prodDetails,
            // ),
            FlatButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(ReviewPage.routeName,
                //     arguments: prodDetails['id']);
              },
              child: Text(
                "View Reviews (${prodDetails['review_count']})",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.red,
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    'View in Bakesbee',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            )),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "Share",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
