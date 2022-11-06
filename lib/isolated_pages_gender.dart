import 'package:flutter/material.dart';
import 'search_engine.dart';
import 'seperate_shoe_page.dart';

import 'fetch_data.dart';
import 'shoe_data.dart';

class GenderPages extends StatefulWidget {
  GenderPages({required this.gender, Key? key}) : super(key: key);

  @override
  State<GenderPages> createState() => GenderPages_State();
  String gender = 'Men';
}

class GenderPages_State extends State<GenderPages> {
  late Future<List<Shoe>> shoeListFuture;

  @override
  void initState() {
    super.initState();
    shoeListFuture = widget.gender == 'Men'
        ? fetchDataMen()
        : widget.gender == 'Women'
            ? fetchDataWomen()
            : widget.gender == 'Children'
                ? fetchDataChild()
                : fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.gender}'s Page", style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            onPressed: () async => showSearch(
                context: context,
                delegate: SearchEngine(shoeList: await shoeListFuture)),
            // Navigator.of(context)
            // .push(MaterialPageRoute(builder: (_) => const SearchPage())),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return FutureBuilder<List<Shoe>>(
      future: shoeListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Shoe>? shoeList = snapshot.data;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return getCard(snapshot.data![index], shoeList!, index);
            },
          );
        } else {
          return Text('Loading...');
        }
      },
    );
  }

  Widget getCard(Shoe shoeIndex, List<Shoe> shoeList, int index) {
    return Card(
      elevation: 40,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute<void>(builder: (BuildContext context) {
                return SeparateShoePages(shoeList: shoeList, shoeIndex: index,);
              }));
        },
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
                    return const Text(
                      'error: could not load image.',
                      textAlign: TextAlign.center,
                    );
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
              Text('\$${shoeIndex.price}', style: TextStyle(fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
