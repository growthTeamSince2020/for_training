import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class AlertDialogPage extends StatelessWidget {

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
                title: Text('alertDialog'),
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
                    Text('alertDialogの実装を試す\n(ダイアログ)\n',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          logger.d("ボタン押されたので確認ダイアログを表示");
                          //---
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("タイトル"),
                                content: Text("メッセージ内容"),
                                actions: [
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              );
                            },
                          );
                          //---
                        },
                        child: Text('確認ダイアログ１')),
                    Text('↑AlertDialog　Android風\n',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          logger.d("ボタン押されたので確認ダイアログを表示");
                          //---
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text("タイトル"),
                                content: Text("メッセージ内容"),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text('Cancel'),
                                    isDestructiveAction: true,
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              );
                            },
                          );
                          //---
                        },
                        child: Text('確認ダイアログ２')),
                    Text('↑CupertinoAlertDialog　ios風\n',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          logger.d("ボタン押されたので確認ダイアログを表示");
                          //---
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                title: Text("タイトル"),
                                children: [
                                  SimpleDialogOption(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("選択肢1"),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("選択肢2"),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("選択肢3"),
                                  ),
                                ],
                              );
                            },
                          );
                          //---
                        },
                        child: Text('確認ダイアログ３')),
                    Text('↑SimpleDialog 3つ以上選択肢可能\n',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          logger.d("ボタン押されたので確認ダイアログを表示");
                          //---
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text("タイトル"),
                                content: Text("メッセージ内容"),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              );
                            },
                          );
                          //---
                        },
                        child: Text('完了メッセージ１')),
                    Text('↑選択肢を１つにして出す',
                      style: TextStyle(
                          fontSize: 20.sp
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
