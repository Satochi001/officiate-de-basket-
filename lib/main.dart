
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/providers%20/widgets0-provider.dart';
import 'package:provider/provider.dart';
import 'body.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context ) => myProvider(),
        child: const MyApp(),
    )
  );
}

