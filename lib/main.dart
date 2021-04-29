

import 'package:flutter/material.dart';
import 'package:flutter_app2/pages/loading.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app2/pages/choose_location.dart';
import 'package:flutter_app2/pages/home.dart';
import 'package:flutter_app2/pages/loading.dart';

void main() {
  runApp(MaterialApp(


      initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),

    },

        


      )
  );
}






