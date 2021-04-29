

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
class WorldTime{

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({this.location,this.flag,this.url});


  Future<http.Response> getTime() async {

    try{
      // make the request



      var client= http.Client();
       var  response=   await   client.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));


      Map data= jsonDecode(response.body);

     String datetime=  data['datetime'];

      String offset=data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours:int.parse(offset)));

        isDaytime=(now.hour>5&&now.hour<19) ?true:false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print(e);
      time = 'could not get time';
    }

  }


}