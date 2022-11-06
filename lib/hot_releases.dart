import 'package:flutter/material.dart';
import 'search_engine.dart';
import 'seperate_shoe_page.dart';
import 'shoe_data.dart';
import 'fetch_data.dart';

class HotReleasesPage extends StatefulWidget {
  const HotReleasesPage({Key? key}) : super(key: key);

  @override
  State<HotReleasesPage> createState() => _HotReleasesPageState();
}

class _HotReleasesPageState extends State<HotReleasesPage> {
  late Future<List<Shoe>> shoeListFuture;

  @override
  void initState() {
    super.initState();
    shoeListFuture = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Icon customIcon = const Icon(Icons.search);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOT RELEASES!!!!!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
        ),
        actions: [
          IconButton(
            onPressed: () async => showSearch(
                context: context,
                delegate: SearchEngine(shoeList: await shoeListFuture)),
            icon: customIcon,
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
            return SeparateShoePages(shoeList: shoeList, shoeIndex: index);
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
              Text('\$${shoeIndex.price}', style: const TextStyle(fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
