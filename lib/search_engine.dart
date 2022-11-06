import 'package:flutter/material.dart';
import 'shoe_data.dart';

class SearchEngine extends SearchDelegate{
  List<Shoe> shoeList;
  SearchEngine({required this.shoeList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Shoe> matchQuery = [];
    for (var shoe in shoeList ) {
      if (shoe.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(shoe);
      }
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return getCard(matchQuery[index]);
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Shoe> matchQuery = [];
    for (var shoe in shoeList ) {
      if (shoe.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(shoe);
      }
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return getCard(matchQuery[index]);
      },
    );
  }

  Widget getCard(Shoe shoeIndex) {
    return Card(
      elevation: 40,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 5),
              ),
              child: Image.network(
                shoeIndex.urlImage,
                height: 130,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Text('error: could not load image.',
                    textAlign: TextAlign.center,);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(shoeIndex.name)),
                ],
              ),
            ),
            Text('\$${shoeIndex.price}', style: const TextStyle(fontSize: 14) )
          ],
        ),
      ),
    );
  }
}