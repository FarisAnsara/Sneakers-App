import 'package:flutter/material.dart';
import 'package:hahaaa/home_page.dart';
import 'string_extension.dart';
import 'shoe_data.dart';

class SeparateShoePages extends StatefulWidget {
  SeparateShoePages({ required this.shoeList, required this.shoeIndex, Key? key})
      : super(key: key);
  List<Shoe> shoeList;
  int  shoeIndex;

  @override
  State<SeparateShoePages> createState() => _SeparateShoePagesState();
}

class _SeparateShoePagesState extends State<SeparateShoePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: PageView.builder(
        controller: PageController(initialPage: widget.shoeIndex),
        itemCount: widget.shoeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return shoePage(widget.shoeList[index]);
        },
      ),
    );
  }

  Widget shoePage(Shoe shoeIndex) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.network(
            shoeIndex.urlImage,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            shoeIndex.name,
            style: const TextStyle(fontFamily: 'Roboto', fontSize: 23),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Brand: ${shoeIndex.brand.capitalize()}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Price: \$${shoeIndex.price}',
                  style: const TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                shoeIndex.inInventory
                    ? Text(
                  'In Stock',
                  style: TextStyle(
                      fontSize: 17, color: Colors.green[700]),
                )
                    : shoeIndex.inInventory
                    ? Text(
                  'Out of stock',
                  style: TextStyle(
                      fontSize: 17, color: Colors.red[800]),
                )
                    : Text(
                  'Out of stock',
                  style: TextStyle(
                      fontSize: 17, color: Colors.red[800]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Category: ${shoeIndex.category.capitalize()}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Section: ${shoeIndex.gender.capitalize()}',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                shoeIndex.inInventory
                    ? Text(
                  'Items Left: ${shoeIndex.itemsLeft}',
                  style: const TextStyle(fontSize: 17),
                )
                    : shoeIndex.inInventory
                    ? const Text(' ')
                    : const Text(' ')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
