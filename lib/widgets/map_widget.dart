import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/location_service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

// ignore: constant_identifier_names
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoicGl0bWFjIiwiYSI6ImNsY3BpeWxuczJhOTEzbnBlaW5vcnNwNzMifQ.ncTzM4bW-jpq-hUFutnR1g';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? myPosition;
  void getCurrentLocation() async {
    try {
      Position position = await determinePosition();
      setState(() {
        myPosition = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return myPosition == null
        ? ListView(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/map.png',
                    height: 260,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    left: 18,
                    right: 19,
                    bottom: 15,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.asset(
                              'assets/images/df.png',
                              height: 60,

                              width: 60,
                              //   width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Відсутній сигнал ',
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontFamily: 'RFDewi',
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                            child: Text(
                              "Відсутність доступу до геолокації.\nПереконайтеся, що у додатку увімкнено\nгеолокацію та перевірте з'єднання з Інтернетом.",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontFamily: 'RFDewi',
                                  fontWeight: FontWeight.w400),
                              textAlign:
                                  TextAlign.center, // Align text in the center
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 85,
                              ),
                              const Text(
                                'Налаштування геолокації',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF0CBA70),
                                  fontFamily: 'SFPro',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(
                                    0.0), // Add padding to the container if needed
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle the onTap action
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0xFF0CBA70),
                                    size: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Add more Text widgets as needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : Center(
            child: FlutterMap(
              options: MapOptions(
                center: myPosition,
                minZoom: 5,
                maxZoom: 25,
                zoom: 18,
              ),
              nonRotatedChildren: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: const {
                    'accessToken': MAPBOX_ACCESS_TOKEN,
                    'id': 'mapbox/dark-v10', // Use the dark map style
                  },
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: myPosition!,
                      builder: (context) {
                        return const Icon(
                          Icons.location_history,
                          color: Color(0xFF0CBA70),
                          size: 40,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
