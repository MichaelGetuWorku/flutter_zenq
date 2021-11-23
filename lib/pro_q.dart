// ignore_for_file: file_names

import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:zenq/zenq.dart';
import 'package:http/http.dart' as http;

class Quotes with ChangeNotifier {
  late List<Zenq> _quotes = [];

  List<Zenq> get quotes {
    return [..._quotes];
  }

  // List<Zenq> get authors {
  //   return [..._quotes];
  // }

  Future<void> getZenqs() async {
    const url = 'https://zenquotes.io/api/quotes';
    final response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));
    final List<dynamic> meh = json.decode(response.body);
    // print('-------');
    // print(meh);
    // final zenExtractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Zenq> lodedeq = [];

    for (var element in meh) {
      lodedeq.add(
        Zenq(
          quote: element['q'],
          authot: element['a'],
        ),
      );
    }
    // for (var element in meh) {
    //   lodedeq.add(
    //     Zenq(
    //       quote: element['q'],
    //       authot: element['q'],
    //     ),
    //   );
    // }
    // zenExtractedData.forEach((zenId, zenData) {
    //   lodedeq.add(Zenq(
    //     quote: zenData['q'],
    //     authot: zenData['a'],
    //   ));
    // });
    _quotes = lodedeq;

    notifyListeners();
  }
}
