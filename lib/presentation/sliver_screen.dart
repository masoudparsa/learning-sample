import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({super.key});

  @override
  State<SliverScreen> createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.amber,
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Sliver"),
                titlePadding: EdgeInsets.only(bottom: 50),
                centerTitle: true,
                background: Image.asset(
                  "assets/images/images.png",
                  fit: BoxFit.cover,
                ),
              ),
              bottom: TabBar(tabs: [
                Tab(
                  text: "Person",
                ),
                Tab(
                  text: "Admin",
                )
              ]),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                color: Colors.blueAccent[100],
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.red,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.green,
                    )
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
