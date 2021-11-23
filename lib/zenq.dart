import 'package:flutter/cupertino.dart';

class Zenq with ChangeNotifier {
  // late final int id;
  late final String quote;
  late final String authot;

  Zenq({
    // required this.id,
    required this.quote,
    required this.authot,
  });
}
