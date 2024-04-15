import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CircularController extends ChangeNotifier {
  int quantity = 0;
}

final circularController =
    ChangeNotifierProvider((ref) => CircularController());
