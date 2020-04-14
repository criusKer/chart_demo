import 'package:chartdemo/page/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chartdemo/path.dart' as Path;

/// create by crius on 2020/3/27

var HomePage = () => BodyPage.fromBuild((ctx, params, router){


  return SafeArea(  // 有刘海屏等遮挡时会留出安全空间
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(msg: '跳转到折线图');
                  },
                  child: Text('折线图(fl_chart使用)')
                ),
                GestureDetector(
                    onTap: (){
                      router.to(ctx, Path.PieChartPage, {});
                     //Fluttertoast.showToast(msg: '跳转到饼图');
                    },
                    child: Text('饼图(charts_flutter库使用)'))
              ],
            ),
      ),);
});