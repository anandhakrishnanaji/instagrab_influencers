import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagrab_influencers/widgets/smallBox.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _orddetailkey = new GlobalKey<ScaffoldState>();

class OrderDetailsPage extends StatefulWidget {
  static const routeName = 'OrderPage/';

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Map orderDetails = ModalRoute.of(context).settings.arguments;
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _orddetailkey,
        appBar: AppBar(title: Text("Order Details")),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: y * 0.0108, horizontal: x * 0.0203),
            child: Container(
              width: x,
              //height: y / 1.35,
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: y * 0.013, horizontal: x * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Offer #${orderDetails['id']}",
                              style: TextStyle(
                                  fontSize: y * 0.02, color: Colors.green)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: y * 0.013, horizontal: x * 0.025),
                            child: Text("BEECODE " + "1245",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            orderDetails['image320'],
                            height: x / 3,
                          ),
                        ),
                      ),
                      Itemrow(
                        prodid: orderDetails['prodid'],
                        qty: orderDetails['quantity'],
                        itemname: orderDetails['product_name'],
                        amount: orderDetails['total'].toString(),
                        kg: orderDetails['kg'],
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Customer Details:',
                                  style: TextStyle(fontSize: y * 0.023)),
                            ),
                            AddressRow(
                              phoneNo: orderDetails['phone'],
                              name: orderDetails['customer_name'],
                              address: orderDetails['address'],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Order Customizations:',
                                  style: TextStyle(fontSize: y * 0.023)),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  SmallBox(
                                    title: "Quantity",
                                    value: orderDetails['quantity'].toString(),
                                  ),
                                  //Only If Cake
                                  SmallBox(
                                    title: 'Shape',
                                    value: orderDetails['shape'],
                                  ),
                                  SmallBox(
                                    title: 'Message on Cake/Pack',
                                    value: orderDetails['cake_message'],
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  SmallBox(
                                    title: 'Delivery Date',
                                    value: orderDetails['delivery_date'],
                                  ),
                                  SmallBox(
                                    title: 'Delivery Time',
                                    value: orderDetails['delivery_time'],
                                  ),
                                  Divider(),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text("Status"),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(orderDetails['status']),
                                                  Text(
                                                    "[Change]",
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class Itemrow extends StatelessWidget {
  const Itemrow(
      {@required this.prodid,
      @required this.itemname,
      @required this.qty,
      this.kg,
      @required this.amount});

  final int qty, prodid;
  final double kg;
  final String itemname;
  final String amount;

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: x * 0.4,
                  child: kg != null
                      ? Text(
                          '$itemname($kg kg)',
                          style: TextStyle(fontSize: y * 0.022),
                        )
                      : Text(
                          '$itemname',
                          style: TextStyle(fontSize: y * 0.022),
                        ),
                ),
                RaisedButton(
                  onPressed: () => {},
                  color: Theme.of(context).primaryColor,
                  child: Text("View"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total amount:',
                  style: TextStyle(fontSize: y * 0.02),
                ),
                Text(
                  '₹ ' + '$amount',
                  style: TextStyle(fontSize: y * 0.03, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressRow extends StatelessWidget {
  final phoneNo;
  final String name;
  final String address;
  //final LatLng center;
  //final LatLng start;
  //final LatLng destination;

  AddressRow({
    this.phoneNo,
    @required this.name,
    @required this.address,
    //@required this.center,
    //@required this.start,
    //@required this.destination
  });
  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final x = MediaQuery.of(context).size.width;
    final y = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.symmetric(horizontal: x * 0.0125),
          child: Text('$name\n$address'),
        ),
        GestureDetector(
          onTap: () => makePhoneCall('tel:$phoneNo'),
          child: Container(
            child: Icon(Icons.phone_in_talk),
            height: y * 0.115,
            width: x * 0.115,
          ),
        ),
      ],
    );
  }
}
