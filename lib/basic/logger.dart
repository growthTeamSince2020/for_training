import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class LoggerPage extends StatefulWidget {
  const LoggerPage({Key? key}) : super(key: key);

  @override
  State<LoggerPage> createState() => _LoggerPageState();
}

class _LoggerPageState extends State<LoggerPage> {
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
            title: 'logger',
            home: Scaffold(
              appBar: AppBar(
                title: Text('logger'),
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
                    Text('loggerの実装を試す\n(runウインドウにレベルごとのLOGを出力)',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          logger.t("Trace log");
                          logger.d("Debug log");
                          logger.i("Info log");
                          logger.w("Warning log");
                          logger.e("Error log", error: 'Test Error');
                          logger.f("What a fatal log", error: FormatException(), stackTrace: null);
                        },
                        child: Text('logを出力')),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
