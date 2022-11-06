import 'package:flutter/material.dart';
import 'map_services.dart';
import 'isolated_pages_gender.dart';
import 'shoe_data.dart';

class HomePageDesign extends StatefulWidget {
  const HomePageDesign({Key? key}) : super(key: key);

  @override
  State<HomePageDesign> createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  late Future<List<Shoe>> shoeListFuture;
  final ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        const Text('Shop Now!', style: TextStyle(height: 2.0, fontSize: 32)),
        ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return GenderPages(gender: 'Men');
            }));
          },
          child: const Text(
            "Men's",
            style: TextStyle(fontSize: 30, height: 1.7),
            textAlign: TextAlign.center,
          ),
        ),
        const Image(image: AssetImage('assets/images/mens_shoes.jpg')),
        const SizedBox(height: 15.0),
        ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return GenderPages(gender: 'Women');
              ;
            }));
          },
          child: const Text(
            "Women's",
            style: TextStyle(fontSize: 30, height: 1.7),
            textAlign: TextAlign.center,
          ),
        ),
        const Image(image: AssetImage('assets/images/womens_shoes.jpg')),
        const SizedBox(height: 15.0),
        ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return GenderPages(gender: 'Children');
            }));
          },
          child: const Text(
            "Children's",
            style: TextStyle(fontSize: 30, height: 1.7),
            textAlign: TextAlign.center,
          ),
        ),
        const Image(image: AssetImage('assets/images/children_shoes.jpg')),
      ],
    );
  }
}
