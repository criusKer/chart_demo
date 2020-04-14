import 'package:chartdemo/page/home.dart';
import 'package:chartdemo/page/pie_chart.dart';
import 'package:chartdemo/router.dart';
import 'package:flutter/material.dart';
import 'package:chartdemo/path.dart' as Path;

/// create by crius on 2020/3/27

class MyApp extends StatelessWidget {

  static RouteFactory router = (RouteSettings settings) {
    PageRoute widget;
    route.pages.forEach((path, page) {
      if (path == settings.name) {
        var args = settings.arguments;
        if(args == null){
          args = ({
            "name": settings.name,
            "init": settings.isInitialRoute
          });
        } else {
          (args as Map)["path"] = settings.name;
          (args as Map)["init"] = false;
        }
        widget = page.build(args, route);
      }
    });
    return widget;
  };

  MyApp(){
    route.add(Path.Home, HomePage());
    route.add(Path.PieChartPage, PieChartPage());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crius Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: router,
        initialRoute: "/",
        debugShowCheckedModeBanner: false,  // 调试时去掉界面中右上角的debug字样

    );
  }
}