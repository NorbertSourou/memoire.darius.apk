import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/PatientController.dart';

import '../Constants.dart';

class Listtile extends StatefulWidget {
  const Listtile({Key key, @required int id})
      : _id = id,
        super(key: key);
  final int _id;

  @override
  _ListtileState createState() => _ListtileState();
}

class _ListtileState extends State<Listtile> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
       Get.toNamed("/details/${productController.productList[widget._id].id}");
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: new Text(
          productController.productList[widget._id].nom
              .substring(0, 1)
              .capitalize,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: Constants.font400),
        ),
      ),
      trailing: Text(
        "Lit n° ${productController.productList[widget._id].idLit.numLit}",
        style: TextStyle(fontFamily: 'Poppins', fontWeight: Constants.font400),
      ),
      title: Text(
        productController.productList[widget._id].nom +
            " " +
            productController.productList[widget._id].prenoms,
        style: TextStyle(fontFamily: 'Poppins', fontWeight: Constants.font400),
      ),
      subtitle: Text(
        "Stable",
        style: TextStyle(fontFamily: 'Poppins', fontWeight: Constants.font600),
      ),
    );
  }
}
