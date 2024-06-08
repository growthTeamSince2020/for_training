import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class SampleSeachAppPage extends StatelessWidget {

  // デフォルトでリリースビルドは出力しない、デバッグビルドはすべてログ出力する動作になっている
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        //基準の画面サイズ設定
        minTextAdapt: true,
        //幅と高さの最小値に応じてテキストサイズを可変させるか
        splitScreenMode: true,
        //split screenに対応するかどうか
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            title: 'フォーム部品試し',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            home: Scaffold(
              appBar: AppBar(
                title: Text('フォームの部品試し',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
                ),
                leadingWidth: 85.w,
                leading: TextButton(
                  child: Text(
                    '戻る',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
                body: Card( //カードを配置
                  elevation: 4.0, //かげの設定
                  margin: const EdgeInsets.all(16.0),//全方向に空白
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _titleArea(),
                      _buttonArea(),
                    ],
                  ),
                )
            ),
          );
        });
  }

  _titleArea() {}
  _buttonArea() {}
}
