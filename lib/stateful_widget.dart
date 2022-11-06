import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page_design.dart';
import 'hot_releases.dart';
import 'map_services.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({required this.func, required this.isDarkMode, Key? key})
      : super(key: key);
  Function func;
  bool isDarkMode;

  // final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cop-it',
            style: TextStyle(fontFamily: 'Roboto', fontSize: 22),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.new_releases)),
            ],
          ),
          backgroundColor: Colors.grey[850],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                padding: EdgeInsets.fromLTRB(10, 30, 18, 18),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.rectangle,
                ),
                child: Text('Settings',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Roboto',
                    )),
              ),
              CupertinoSlidingSegmentedControl<bool>(
                  padding: const EdgeInsets.all(8),
                  groupValue: widget.isDarkMode,
                  children: {
                    true: buildSegment('Dark Mode'),
                    false: buildSegment('Light mode'),
                  },
                  onValueChanged: (state) {
                    widget.func(state);
                  }),
              const SizedBox(
                height: 500,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MapServices()));
                  },
                  child: const Text('Our Shop'))
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Tab(
              child: HomePageDesign(),
            ),
            Tab(
              child: Center(
                child: HotReleasesPage(),
              ),
            )
          ],
          // ),
        ),
      ),
    );
  }

  Widget buildSegment(String text) {
    return Text(text,
        style: const TextStyle(
          fontSize: 18,
        ));
  }
}
