import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailLoader extends StatefulWidget {
  const DetailLoader({Key key}) : super(key: key);

  @override
  _DetailLoaderState createState() => _DetailLoaderState();
}

class _DetailLoaderState extends State<DetailLoader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: true,
                child: SingleChildScrollView(
                  // physics: const AlwaysScrollableScrollPhysics(),
                  // padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      _buildheader(),
                      SizedBox(
                        height: 25,
                        // height: MediaQuery.of(context).orientation ==
                        //         Orientation.portrait
                        //     ? size.height * 0.088
                        //     : size.width * 0.088),),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    print(size.width);
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.portrait
                                            ? size.height * 0.334
                                            : size.width * 0.334,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context)
                                                .orientation ==
                                            Orientation.portrait
                                        ? MediaQuery.of(context).size.height *
                                            0.018
                                        : MediaQuery.of(context).size.width *
                                            0.018),
                                Container(
                                  height:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? size.height * 0.211
                                          : size.width * 0.211,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.018
                                  : MediaQuery.of(context).size.width *
                                      0.018),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.portrait
                                            ? size.height * 0.211
                                            : size.width * 0.211,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context)
                                                .orientation ==
                                            Orientation.portrait
                                        ? MediaQuery.of(context).size.height *
                                            0.018
                                        : MediaQuery.of(context).size.width *
                                            0.018),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).orientation ==
                                                Orientation.portrait
                                            ? size.height * 0.334
                                            : size.width * 0.334,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  }

  Widget _buildheader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.1757
              : MediaQuery.of(context).size.width * 0.1757,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.1757
              : MediaQuery.of(context).size.width * 0.1757,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(width: 3, color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(200),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.018
              : MediaQuery.of(context).size.height * 0.018,
        ),
        Expanded(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
        )
      ],
    );
  }
}
