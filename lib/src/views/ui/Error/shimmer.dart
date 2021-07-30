import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/PatientController.dart';
import 'package:memoire/src/views/utils/Constants.dart';
import 'package:memoire/src/views/utils/widgets/Loader.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatefulWidget {
  const LoadingShimmer({Key key}) : super(key: key);

  @override
  _LoadingShimmerState createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title:Text("Shimmer")
               ),
        body: loading(enabled: _enabled),
      ),
    );
  }
}

