import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MyApp1(),
    );
  }
}

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverAppBarKullanimi(context),
            ]),
        body: GetBody(),
      ),
    );
  }

  SingleChildScrollView GetBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 70,
          ),
          SizedBox(
            height: 200,
            child: Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 20 + 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.white,
                              ],
                              begin: Alignment(0, 4.8),
                              end: Alignment(0, 0),
                            ),
                          ),
                          child: Center(child: Text('note : $index')),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar SliverAppBarKullanimi(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      snap: false,
      pinned: true,
      floating: false,
      expandedHeight: 300,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.home,
          size: 30,
        ),
      ),
      actions: const [
        Icon(
          Icons.add,
          size: 30,
        ),
      ],
      backgroundColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0,
      foregroundColor: Colors.black,
      flexibleSpace: Stack(children: [
        FlexibleSpaceBar(
          // home swipe size expandedTitleScale
          expandedTitleScale: 4.5,
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          background: Stack(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/add.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.black12],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            )
          ]),
        ),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.white.withAlpha(0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ]),
    );
  }
}
