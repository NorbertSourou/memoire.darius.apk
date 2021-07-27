import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memoire/src/views/utils/Constants.dart';

class Details extends StatefulWidget {
  const Details({Key key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("John Doe"),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () {
          debugPrint("hi");
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _buildheader(),
                SizedBox(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? size.height * 0.088
                        : size.width * 0.088),
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
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? size.height * 0.334
                                  : size.width * 0.334,
                              color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "2",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                          ),
                                    ),
                                    trailing: Icon(
                                      FontAwesomeIcons.heart,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Rythme Cardiaque',
                                      style: Constants.whiteText,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.018
                                  : MediaQuery.of(context).size.width * 0.018),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? size.height * 0.211
                                  : size.width * 0.211,
                              color: Colors.grey.shade500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "2",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.account_box,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Complément',
                                      style: Constants.whiteText,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.height * 0.018
                            : MediaQuery.of(context).size.width * 0.018),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? size.height * 0.211
                                  : size.width * 0.211,
                              color: Colors.green,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "hey",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.cloud_upload,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Migrations',
                                      style: Constants.whiteText,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.height * 0.018
                                  : MediaQuery.of(context).size.width * 0.018),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? size.height * 0.334
                                  : size.width * 0.334,
                              color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "Hey",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                            fontSize: 24.0,
                                            color: Colors.white,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.hd,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Recrutements',
                                      style: Constants.whiteText,
                                    ),
                                  ),
                                ],
                              ),
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
          child: Center(
            child: Text(
              "25 °C",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
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
              Text(
                "Température ambiante",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}
