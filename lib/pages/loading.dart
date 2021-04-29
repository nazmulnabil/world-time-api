
import 'package:flutter/material.dart';
import 'package:flutter_app2/services/world_time.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_LoadingState();



}

class _LoadingState extends State<Loading>{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.blue[900] ,
      body:Center(
        child:SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,

        ) ,

      )
      ,


    );
  }

  void setupWorldTime() async{
   WorldTime worldTime=WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

  await worldTime.getTime ();
   Navigator.pushReplacementNamed(context, '/home',arguments: {

     'location':worldTime.location,
     'flag':worldTime.flag,
     'time':worldTime.time,
     'isDaytime':worldTime.isDaytime,


   });






  }






}