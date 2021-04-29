import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }




}
class _HomeState extends State<Home>{

  Map data={};

  @override
  Widget build(BuildContext context) {

   data= data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
   Color bgColor=data['isDaytime']? Colors.blue : Colors.indigo[700];
   String background_img=data['isDaytime']?'day.png':'night.png';
   print(data);
   return  Scaffold(
     backgroundColor: bgColor,
         appBar:AppBar(
           centerTitle: true,

           title: Text('World time',
           style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.white
             ),
            ),

         ),
         body:
         SafeArea(
                child: Container(
         decoration: BoxDecoration(
               image: DecorationImage(
                       image:AssetImage("assets/$background_img"),
                       fit: BoxFit.cover
                  )

    ),

                     child: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,

                           children: [
                             Container(child: Text(data['location'], style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 28,
                                 color: Colors.white
                             ) )

                             ),

                             SizedBox(height: 20.0),

                             Container(child: Text(data['time'], style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 60,
                                 color: Colors.white
                             ))

                             ),

                             SizedBox(height: 20.0),

                             Container(
                               child: ElevatedButton.icon(onPressed: () async{
                               var result=await  Navigator.pushNamed(context, '/location');


                               }, icon:Icon(Icons.location_on_outlined),
                                 label: Text('Choose location',
                                   style:TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       letterSpacing: 2.0,
                                       fontSize: 20
                                   ),
                                 )
                               ),
                                               ),









                                         ],
                                       ),
                     ),
                   ),

                               ),








               );



  
  }
  
  
  
  
  
}