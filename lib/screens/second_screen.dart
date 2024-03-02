import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/location_service.dart';
import 'package:flutter_application_1/widgets/bottom_navigation_bar.dart';
import 'package:flutter_application_1/widgets/map_widget.dart';
import 'package:flutter/cupertino.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  const SecondScreen({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Set this to false to hide the back arrow

        backgroundColor: const Color(0xFF0CBA70), // Background color
        elevation: 0, // Remove the shadow
        centerTitle: true,
        title: const Text(
          'logo',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontFamily: 'SFPro',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CupertinoButton(
              onPressed: () {
                // Your action
              },
              child: const Icon(
                CupertinoIcons.phone,
                color: CupertinoColors.white,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF0CBA70),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                    ),
                    height: 235,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Stack(
                                children: [
                                  Positioned(
                                    //  top:20,
                                    child: Image.asset(
                                      'assets/images/car_card.png',
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    left: 215,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Image.asset(
                                        'assets/images/car_logo.png',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 60,
                                    left: 180,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Image.asset(
                                        'assets/images/question_mark.png',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 25,
                                    bottom: 10.0,
                                    left: 25.0,
                                    // right: 16.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Привіт,',
                                          style: TextStyle(
                                              fontFamily: 'RFDewi',
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          name,
                                          style: const TextStyle(
                                              fontSize: 19,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 12),
                                        const Text(
                                          'Додавання авто',
                                          style: TextStyle(
                                              fontFamily: 'RFDewi',
                                              fontSize: 8,
                                              color: Colors.white60),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Завантажте дані про ваше авто для\nкращого використання сервісу.',
                                          style: TextStyle(
                                              fontFamily: 'RFDewi',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 8.7,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 15.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Додати авто',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFF0CBA70),
                                                  fontFamily: 'SFPro'),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(
                                                  0.0), // Add padding to the container if needed
                                              child: const Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color: Color(0xFF0CBA70),
                                                size: 12,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FutureBuilder<bool>(
                  future: checkLocationPermission(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null &&
                        (snapshot.data! || snapshot.hasData)) {
                      // Location permission granted, show the map
                      return SizedBox(
                        height: 260,
                        width: 320,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: const MapScreen(),
                        ),
                      );
                    } else {
                      // Location permission not granted, show the placeholder image
                      return const LinearProgressIndicator();
                    }
                  }),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF0CBA70)),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 48),
                    ),
                  ),
                  child: const Text('Викликати майстра',
                      style:
                          TextStyle(fontFamily: 'SFPro', color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
