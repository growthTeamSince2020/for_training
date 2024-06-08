import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class ScreenutilPage extends StatelessWidget{
  //StatelessWidgetでもロガーが使えることをかくにん
  final logger = Logger();

  @override
  Widget build(BuildContext context){
    logger.d("遷移してきたぜ");
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 640), //基準の画面サイズ設定
      minTextAdapt: true, //幅と高さの最小値に応じてテキストサイズを可変させるか
      splitScreenMode: true, //split screenに対応するかどうか
    // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          title: 'Flutter screenutil',
          home: Scaffold(
            appBar: AppBar(
              title: Text('screenutil'),
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
                children:<Widget>[
                  Container( color: Colors.green, width:40.w, height: 40.0.h,
                    child :Text('40サイズ',style: TextStyle(fontSize: 10.sp),),
                  ),
                  Container( color: Colors.red, width:60.w, height: 60.0.h,
                    child :Text('60サイズ',style: TextStyle(fontSize: 10.sp),),
                  ),
                  Container( color: Colors.yellow, width:80.w, height: 80.0.h,
                  child :Text('80サイズ',style: TextStyle(fontSize: 10.sp),),
                  ),
                  Text('10サイズ',
                        style:TextStyle(
                          fontSize: 10.sp
                    ),
                  ),
                  Text('15サイズ',
                    style:TextStyle(
                        fontSize: 15.sp
                    ),
                  ),
                  Text('20サイズ',
                    style:TextStyle(
                        fontSize: 20.sp
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    }
  }
