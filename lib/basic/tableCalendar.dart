import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
class TableCalendarPage extends StatefulWidget {
  const TableCalendarPage({Key? key}) : super(key: key);

  @override
  State<TableCalendarPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<TableCalendarPage> {

  DateTime _calenderFocusedDay = DateTime.now(); //現在日付をフォーカスする日付に設定　
  DateTime? _selectedDay; //初期は現在日付を選択する日付に設定　

  //なぜか現在日付で変数を定義して、その変数を使い下の二つを定義できない(DateTime.now().を変数にして使用出来ない)
  var _calenderFirstYear = DateTime.now().year - 10; //現在から10年前までのカレンダー表示　
  var _calenderEndYear = DateTime.now().year + 10; //現在から10年後までのカレンダー表示
  List<String> _selectedEvents = []; //イベント格納

  //サンプルイベントのマップ
  final sampleMap = {
    DateTime.utc(2023, 9, 3): ['firstEvent', 'secodnEvent'],
    DateTime.utc(2023, 10, 5): ['thirdEvent', 'fourthEvent']
  };


  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
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
          title: 'Flutter TableCalendar',
          home: Scaffold(
            appBar: AppBar(
              title: Text('TableCalendar'),
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
                  Text('TableCalendarの実装を試す',
                    style: TextStyle(
                        fontSize: 20.sp
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        this._selectedDay = DateTime.now();
                        this._calenderFocusedDay = DateTime.now();
                      });
                    },
                    child: Text('今日'),
                  ),
                  TableCalendar(
                    locale: 'ja_JP',
                    //表示を日本形式にする
                    firstDay: DateTime.utc(_calenderFirstYear, 1, 1),
                    //カレンダーの最初の日付
                    lastDay: DateTime.utc(_calenderEndYear, 1, 1),
                    //カレンダーの最後の日付
                    focusedDay: _calenderFocusedDay,
                    //フォーカスする日
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, //カレンダー形式のフォーマットボタンを非表示
                    ),
                      eventLoader: (date) {
                        return sampleMap[date] ?? [];
                      },
                    // 選択日のアニメーション
                    selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                        setState((){
                          this._selectedDay = selectedDay;
                          this._calenderFocusedDay = focusedDay;
                          this._selectedEvents = sampleMap[selectedDay] ?? [];
                        });
                     },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _selectedEvents.length,
                      itemBuilder: (context, index) {
                        final event = _selectedEvents[index];
                        return Card(
                          child: ListTile(
                            title: Text(event),
                          ),
                        );
                      },
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

