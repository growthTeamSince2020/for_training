import 'package:flutter/material.dart';
import 'package:for_training/basic/alertDialog.dart';
import 'package:for_training/basic/curlHttp.dart';
import 'package:for_training/basic/logger.dart';
import 'package:for_training/basic/screenutil.dart';
import 'package:for_training/basic/sampleSeachAppPage.dart';
import 'basic/container.dart';
import 'basic/tableCalendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        //画面遷移ルートの設定
        '/home': (BuildContext context) => MyHomePage(),
        //home
        '/basic/container': (BuildContext context) => ContainerPage(),
        //container
        '/basic/screenutil': (BuildContext context) => ScreenutilPage(),
        //screenutil　コンテナサイズ、フォントサイズの自動調整
        '/basic/tableCalender': (BuildContext context) => TableCalendarPage(),
        //TableCalendar　テーブルカレンダー
        '/basic/logger': (BuildContext context) => LoggerPage(),
        //loggingの試し
        '/basic/alertDialog': (BuildContext context) => AlertDialogPage(),
        //alertDialogの試し
        '/basic/curlHttp': (BuildContext context) => CurlHttpPage(),
        //alertDialogの試し
        '/basic/sampleSeachAppPage': (BuildContext context) => SampleSeachAppPage(),
        //検索の部品の試し
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('学習内容一覧'),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('以下、学習で試した物一覧'),
            ),
            ListTile(
              leading: Icon(Icons.done_outline),
              title: Text('箇条書きをする　ListView\n（本画面がその一覧の学習内容）'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'Container widget土台',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContainerPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'Screenutil 自動サイズ調整',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenutilPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'TableCalendar カレンダー',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TableCalendarPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'logger ログ出力',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoggerPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'AlertDialog ダイアログ',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlertDialogPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                'http curl API活用 http送信',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurlHttpPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text(
                '検索で使われる入力フォーム試し',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SampleSeachAppPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習ex'),
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text('学習エンド'),
            )
          ],
        ),
      ),
    );
  }
}
