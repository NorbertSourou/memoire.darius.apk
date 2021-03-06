import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataFound extends StatefulWidget {
  const NoDataFound({Key key}) : super(key: key);

  @override
  _NoDataFoundState createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 400,
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  "assets/nodata.svg",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  "Pas de données",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Oops! Pas de données. Glissez vers le bas pour actualisez...",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
              ),

              // FlatButton(
              //   color: Colors.blue,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(50),
              //   ),
              //   onPressed: () {},
              //   child: Text(
              //     "Retry".toUpperCase(),
              //   ),
              // )
            ],
          ),
        ),
      ),

      // Stack(
      //   alignment: Alignment.center,
      //   fit: StackFit.loose,
      //   children: [
      //     SvgPicture.asset(
      //       "assets/nodata.svg",
      //       fit: BoxFit.contain,
      //     ),
      //     Positioned(
      //       bottom: 100,
        //       left: 30,
        //       child: FlatButton(
        //         color: Colors.blue,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(50),
        //         ),
        //         onPressed: () {},
        //         child: Text("Retry".toUpperCase()),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
