import 'package:chartdemo/page/base.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' as common;

/// create by crius on 2020/3/27

var PieChartPage = () => BodyPage.fromBuild((ctx, params, router){


  /// Create one series with sample hard coded data.
  List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      new LinearSales('2017', 95, Colors.red),
      new LinearSales('2018', 75, Colors.grey),
      new LinearSales('2019', 25, Colors.green),
      new LinearSales('2020', 5, Colors.blue),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        data: data,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales sales, _) => charts.ColorUtil.fromDartColor(sales.colorVal),
        labelAccessorFn: (LinearSales sales, _) => '${sales.year}：${sales.sales}',
        outsideLabelStyleAccessorFn: (LinearSales sales, _) =>
          charts.TextStyleSpec(
            fontSize: 12,
            color: charts.ColorUtil.fromDartColor(sales.colorVal),
          )
      )
    ];
  }

  return Scaffold(
    appBar: AppBar(title: Text('饼图示例'),),
    body: SafeArea(
      child: Center(
        child: Container(
          width: 300,
          height: 250,
          child: charts.PieChart(
            _createSampleData(),
            animate: true,
            defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 14,
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.outside,
                    showLeaderLines: true,
                    insideLabelStyleSpec: charts.TextStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.orange),fontSize: 14),
                    outsideLabelStyleSpec: charts.TextStyleSpec(color: charts.ColorUtil.fromDartColor(Colors.orange),fontSize: 14),
//                    leaderLineStyleSpec: charts.ArcLabelLeaderLineStyleSpec(
//                      color: common.Color(r: 250,g: 167,b: 85),
//                      length: 15.0,
//                      thickness: 1.0
//                    ),
                  )
                ]
            )
          ),
        ),
      )
    ),
  );
});

class LinearSales {
  String year;
  int sales;
  Color colorVal;

  LinearSales(this.year, this.sales,this.colorVal);
}