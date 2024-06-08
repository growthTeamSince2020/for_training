import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter container',
      home: Scaffold(
        appBar: AppBar(
          title: Text('container基礎'),
          leadingWidth: 85,  //leadingWidthを設定する
            leading: TextButton(
              child: const Text(
                '戻る',
                style: TextStyle(
                  color: Colors.white,  //文字の色を白にする
                  fontWeight: FontWeight.bold,  //文字を太字する
                  fontSize: 12.0,  //文字のサイズを調整する
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Column(
            children:<Widget>[
              Container(
                color: Colors.white,
              child: const Text('contaner基礎を試していきます。\nbodyの中に子にColumn、その子にWidgetの配列を定義するようにしているところに注目してください。'
                  ,
                style: TextStyle(fontSize: 20,),
              ),
              ),
              Container( color: Colors.green, height: 50.0,
              child: const Text('body: Center( child )'),),
              Container( color: Colors.red, height: 50.0,),
            ],
          ),
        ),
      ),
    );
  }
}