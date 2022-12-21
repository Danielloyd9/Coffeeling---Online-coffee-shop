import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double subtotal(
  int quantity,
  double price,
) {
  return quantity * price;
}

double totalPrice(
  double subtotal,
  double tax,
  double shipping,
) {
  return subtotal + (subtotal * (tax / 100)) + shipping;
}
