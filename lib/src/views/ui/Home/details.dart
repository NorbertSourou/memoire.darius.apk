import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:memoire/src/logic/controllers/DetailsController.dart';
import 'package:memoire/src/logic/controllers/network_controller.dart';
import 'package:memoire/src/views/ui/Error/NoConnection.dart';
import 'package:memoire/src/views/ui/Error/oher_error.dart';
import 'package:memoire/src/views/utils/Constants.dart';
import 'package:memoire/src/views/utils/widgets/details_loader.dart';

class Details extends StatefulWidget {
  const Details({Key key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details>  {
  DetailController detailController = Get.put(DetailController());
  NetworkController _networkController = Get.put(NetworkController());


  // final NetworkController _networkController = Get.find<NetworkController>();
  // final DetailController detailController = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("${Get.parameters['name']}"),
        ),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (_networkController.connectionType.value == 0) {
            return SafeArea(
              child: NoConnection(),
            );
          } else {
            if (detailController.isLoading.value == "loading")
              return SafeArea(
                child: DetailLoader(),
              );
            else if (detailController.isLoading.value == "completed")
              return RefreshIndicator(
                onRefresh: () {
                  return detailController.fetchPatientsSensors();
                },
                child: SafeArea(
                  child: detailController.sensor == null
                      ? Container()
                      : SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16.0),
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
                                            height: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? size.height * 0.334
                                                : size.width * 0.334,
                                            color: Colors.blue,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                              ListTile(
                                                title: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Text(
                                                      detailController.sensor
                                                          .value.rythmeCardiaque
                                                          .toString(),
                                                      style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline4
                                                              .copyWith(
                                                                color: int.parse(detailController.sensor.value.rythmeCardiaque) <
                                                                            50 ||
                                                                        int.parse(detailController.sensor.value.rythmeCardiaque) >
                                                                            100
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .white,
                                                                fontSize: 24.0,
                                                              ),
                                                    ),
                                                    Text(
                                                      " bpm",
                                                      style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline4
                                                              .copyWith(
                                                                color: int.parse(detailController.sensor.value.rythmeCardiaque) <
                                                                            50 ||
                                                                        int.parse(detailController.sensor.value.rythmeCardiaque) >
                                                                            100
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .white,
                                                                fontSize: 13.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                trailing: Icon(
                                                  FontAwesome.heartbeat,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
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
                                            height: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.018
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.018),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? size.height * 0.211
                                                : size.width * 0.211,
                                            color: Colors.green,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                ListTile(
                                                  title: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    children: [
                                                      Text(
                                                        "${detailController.sensor.value.mouvement}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 24.0,
                                                            ),
                                                      ),
                                                      Text(
                                                        " fois boug??",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 13.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: Icon(
                                                    Icons.directions_walk,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0),
                                                  child: Text(
                                                    'Mouvement',
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
                                      width: MediaQuery.of(context)
                                                  .orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.height *
                                              0.018
                                          : MediaQuery.of(context).size.width *
                                              0.018),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? size.height * 0.211
                                                : size.width * 0.211,
                                            color: Colors.green,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                              ListTile(
                                                title: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Text(
                                                      "${detailController.sensor.value.temperatureCorporelle}",
                                                      style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline4
                                                              .copyWith(
                                                                color: double.parse(detailController.sensor.value.temperatureCorporelle) <
                                                                            36 ||
                                                                        double.parse(detailController.sensor.value.temperatureCorporelle) >
                                                                            38.55
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .white,
                                                                fontSize: 24.0,
                                                              ),
                                                    ),
                                                    Text(
                                                      " ??C",
                                                      style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline4
                                                              .copyWith(
                                                                color: double.parse(detailController.sensor.value.temperatureCorporelle) <
                                                                            36 ||
                                                                        double.parse(detailController.sensor.value.temperatureCorporelle) >
                                                                            38.55
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .white,
                                                                fontSize: 13.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                trailing: Icon(
                                                  FontAwesome.thermometer_empty,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: Text(
                                                  'Temp??rature Corporelle',
                                                  style: Constants.whiteText,
                                                ),
                                              )
                                            ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.portrait
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.018
                                                : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.018),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? size.height * 0.334
                                              : size.width * 0.334,
                                          color: Colors.blue,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              ListTile(
                                                title: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Text(
                                                      "${detailController.sensor.value.humidite}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4
                                                          .copyWith(
                                                            fontSize: 24.0,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Text(
                                                      " %",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4
                                                          .copyWith(
                                                            fontSize: 13.0,
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                trailing: Icon(
                                                  FontAwesome
                                                      .thermometer_quarter,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: Text(
                                                  'Humidit??',
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
            );
          else
            return SafeArea(
              child: OtherError(),
            );
        }
      }),
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
              "${detailController.sensor.value.temperatureAmbiante} ??C",
              style: TextStyle(
                  fontSize: 34,
                  color: double.parse(detailController
                                  .sensor.value.temperatureAmbiante) <
                              20 ||
                          double.parse(detailController
                                  .sensor.value.temperatureAmbiante) >
                              27
                      ? Colors.red
                      : Colors.grey.shade700),
              // Theme.of(context).textTheme.headline4,
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
                "Temp??rature ambiante",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}
