// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:zenq/pro_Q.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Color> _colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.blue,
    ];

    return ChangeNotifierProvider(
      create: (ctx) => Quotes(),
      child: MaterialApp(
        home: HomeWidget(colors: _colors),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({
    required this.colors,
  });

  final List<Color> colors;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var _isInt = true;
  var _isLoding = false;

  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero).then((value) {
  //     Provider.of<Quotes>(context).getZenqs();
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getQoutes();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInt) {
      setState(() {
        _isLoding = true;
      });
      Provider.of<Quotes>(context).getZenqs().then((_) {
        setState(() {
          _isLoding = false;
        });
      });
    }
    _isLoding = false;
    _isInt = false;
  }

  // void getQoutes() async {
  //   Provider.of<Quotes>(context).getZenqs();
  // }

  @override
  Widget build(BuildContext context) {
    final zenData = Provider.of<Quotes>(context);
    String image = 'https://robohash.org/set_set4/5';
    return Scaffold(
      body: TikTokStyleFullPageScroller(
        contentSize: widget.colors.length,
        swipePositionThreshold: 0.1,
        // ^ the fraction of the screen needed to scroll
        swipeVelocityThreshold: 2000,
        // ^ the velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 300),
        // ^ how long the animation will take
        onScrollEvent: _handleCallbackEvent,
        // ^ registering our own function to listen to page changes
        builder: (BuildContext context, int index) {
          return _isLoding
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: widget.colors[index],
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://source.unsplash.com/random/$index',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '"${zenData.quotes[index].quote}"',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          zenData.quotes[index].authot,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  void _handleCallbackEvent(ScrollEventType type, {int? currentIndex}) {
    print(
        "Scroll callback received with data: {type: $type, and index: ${currentIndex ?? 'not given'}}");
  }
}

// class Mytext extends StatelessWidget {
//   const Mytext({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final zenData = Provider.of<Quotes>(context);
//     return Container(
//       height: 100,
//       color: Colors.white,
//       child: ListView.builder(
//         itemCount: zenData.quotes.length,
//         itemBuilder: (_, i) => Column(
//           children: [
//             Second(
//               zenData: zenData.quotes[1].quote,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Second extends StatelessWidget {
//   const Second({
//     Key? key,
//     required this.zenData,
//   }) : super(key: key);

//   final String zenData;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Text(
//         zenData,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 30,
//         ),
//       ),
//     );
//   }
// }
