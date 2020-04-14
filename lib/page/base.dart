
import 'package:chartdemo/router.dart';
import 'package:flutter/material.dart';
import 'package:chartdemo/path.dart' as Path;

/// create by crius on 2020/3/27

typedef Widget BuildFn(BuildContext ctx, Map params, NoRoute router);

class BodyPage extends Page {

  BodyPage();
  BuildFn _build;


  @override
  PageRoute build(Map params, NoRoute router) {

      return MaterialPageRoute(
          builder: (ctx){
            return Scaffold(
              body: _build(ctx, params, router),
            );
          }
      );

  }

  BodyPage.fromBuild(BuildFn build){
    _build = build;
  }

}