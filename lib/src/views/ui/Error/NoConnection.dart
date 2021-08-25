import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({Key key}) : super(key: key);

  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: SvgPicture.asset(
                "assets/noconnection.svg",
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                "No Connection",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Your internet connection was interrupted, Please retry",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: ElevatedButton(
                clipBehavior: Clip.hardEdge,
                onPressed: () {},
                child: Text(
                  "Retry".toUpperCase(),
                ),
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
