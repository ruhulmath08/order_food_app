import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double foodDetailImageAreaSide(BuildContext context) {
  return MediaQuery.of(context).size.height / 3;
}

final currencyFormat = NumberFormat.simpleCurrency();
