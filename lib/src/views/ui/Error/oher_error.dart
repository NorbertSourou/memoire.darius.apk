import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherError extends StatefulWidget {
  const OtherError({Key key}) : super(key: key);

  @override
  _OtherErrorState createState() => _OtherErrorState();
}

class _OtherErrorState extends State<OtherError> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                "Désolé, aucune donnée trouvée de nos serveurs.",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            //   child: ElevatedButton(
            //     clipBehavior: Clip.hardEdge,
            //     onPressed: () {
            //
            //     },
            //     child: Text(
            //       "Retry".toUpperCase(),
            //     ),
            //   ),
            // ),
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
    );
  }
}
