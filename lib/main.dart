import 'package:flutter/material.dart';
import 'city_picker/city_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _fullCityName = "北京 海淀";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(child: Text(_fullCityName, style: TextStyle(fontSize: 30))),
          RaisedButton(
            child: Text("切换城市", style: TextStyle(fontSize: 30)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: Text("选择城市")),
                      body: Container(
                        alignment: Alignment.topCenter,
//                      width: _width,
//                        height: _height,
                        margin: EdgeInsets.only(top: 10),
                        child: Container(
                          width: 400,
//                          height: _height,
//                          alignment: Alignment.topCenter,
                          child: CityPicker(
                            autoFoucus: true,
                            initCity: _trimLast(_fullCityName),
                            onSelectedFn:
                                (String fullCityName, String cityCode) {
                              _fullCityName = fullCityName;

                              Navigator.of(context).pop();
                            },
                            hintText: "请输入城市",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _trimLast(String fullName) {
    String upLevel = "";
    if (null != fullName) {
      final end = fullName.lastIndexOf(" ");
      if (0 < end) {
        upLevel = fullName.substring(0, end);
      }
    }
    return upLevel;
  }
}
