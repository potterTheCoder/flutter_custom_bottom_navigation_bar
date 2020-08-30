import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var images = List(20);

  ScrollController _controller;
  var _toggle;

  @override
  void initState() {
    super.initState();

    images[0] = 'assets/images/img_01.jpg';
    images[1] = 'assets/images/img_02.jpg';
    images[2] = 'assets/images/img_03.jpg';
    images[3] = 'assets/images/img_04.jpg';
    images[4] = 'assets/images/img_05.jpg';
    images[5] = 'assets/images/img_06.jpg';
    images[6] = 'assets/images/img_07.jpg';
    images[7] = 'assets/images/img_08.jpg';
    images[8] = 'assets/images/img_09.jpg';
    images[9] = 'assets/images/img_10.jpg';
    images[10] = 'assets/images/img_11.jpg';
    images[11] = 'assets/images/img_12.jpg';
    images[12] = 'assets/images/img_13.jpg';
    images[13] = 'assets/images/img_14.jpg';
    images[14] = 'assets/images/img_15.jpg';
    images[15] = 'assets/images/img_16.jpg';
    images[16] = 'assets/images/img_17.jpg';
    images[17] = 'assets/images/img_18.jpg';
    images[18] = 'assets/images/img_19.jpg';
    images[19] = 'assets/images/img_20.jpg';

    _toggle = true;
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (_toggle) {
          setState(() {
            _toggle = false;
          });
        }
      }
      if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        if (!_toggle) {
          setState(() {
            _toggle = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Flutter Bottom Navigation Bar'),
      ),
      body: Stack(
        children: [
          // ListView.builder(
          //     controller: _controller,
          //     itemCount: 20,
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         onTap: () => Scaffold.of(context)
          //             .showSnackBar(SnackBar(content: Text(index.toString()))),
          //         child: Padding(
          //             padding: EdgeInsets.only(bottom: 4.0),
          //             child: Card(
          //               color: Colors.white,
          //               child: Padding(
          //                 padding: EdgeInsets.symmetric(
          //                     vertical: 4.0, horizontal: 4.0),
          //                 child: Text(
          //                   'Abcd',
          //                   style: TextStyle(fontSize: 18.0, height: 1.6),
          //                 ),
          //               ),
          //             )),
          //       );
          //     }),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: new StaggeredGridView.countBuilder(
              controller: _controller,
              crossAxisCount: 4,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) => new Container(
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                        image: ExactAssetImage(images[index]),
                        fit: BoxFit.cover)),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 8.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              transform: Matrix4.translationValues(0.0, 50.0, 0.0),
              height: 150,
              duration: Duration(milliseconds: 500),
              color: Colors.transparent,
              alignment: _toggle ? Alignment.topCenter : Alignment.bottomCenter,
              curve: Curves.bounceOut,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                child: BottomAppBar(
                  elevation: 8,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(25.0))),
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.home, size: 30.0),
                          Icon(Icons.search, size: 30.0),
                          Icon(Icons.account_circle, size: 30.0),
                          Icon(Icons.settings, size: 30.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
