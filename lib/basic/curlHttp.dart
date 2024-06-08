import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CurlHttpPage extends StatefulWidget{
  const CurlHttpPage({Key? key}) : super(key: key);
  @override
  State<CurlHttpPage> createState() => _CurlHttpPageState();
}

class _CurlHttpPageState extends State<CurlHttpPage>{
  final logger = Logger();
  String responStr = '';

  void sendHttpUseReq() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
    Uri.https('api.github.com', '/users/growthTeamSince2020/repos');
    // https://api.github.com/users/growthTeamSince2020/repos

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    if (response.statusCode == 200) {
      logger.d('Request failed with status: ${response.statusCode}.');
      logger.d('Request failed with headers: ${response.headers}.');
      logger.d('Request failed with body: ${response.body}.');

    } else {
      logger.d('Request failed with status: ${response.statusCode}.');
    }

    logger.d("終わり!!!");
  }

  @override
  Widget build(BuildContext context){
   // ignore: prefer_const_constructors
   return  ScreenUtilInit(
     designSize: const Size(360, 640),
     minTextAdapt: true,
     splitScreenMode: true,
     builder: (_, child){
       return MaterialApp(
         title: 'http送信',
         home: Scaffold(
           appBar: AppBar(
             title: const Text('http送信'),
             leadingWidth: 85.w,
             leading: TextButton(
               child: Text(
                 '戻る',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 16.sp,
                 ),
               ),
               onPressed: () => Navigator.of(context).pop(),
             ),
           ),
           body: Center(
             child: Column(
               children: <Widget>[
               Text('CURLを行うhttpの実装を試す\n',
               style: TextStyle(
                   fontSize: 20.sp
               ),
             ),
             ElevatedButton(
               onPressed: (){
                 //---
                 showDialog(
                   context: context,
                   builder: (context) {
                     return AlertDialog(
                       title: Text("CURL送信"),
                       content: Text("GITHUBにAPI送信し、リポジトリListを取得しますか？"),
                       actions: [
                         TextButton(
                           child: Text("Cancel"),
                           onPressed: () => Navigator.pop(context),
                         ),
                         TextButton(
                           child: Text("OK"),
                           onPressed: (){
                             logger.d("ボタン押されたのでCurl送信");
                             sendHttpUseReq();
                           } ,
                         ),
                       ],
                     );
                   },
                 );
                 //---
               },
                 child: Text('Curl Gitレポジトリの内容を取得')),
               ],
             ),
           ),
         ),
       );
     },
   );
  }
}