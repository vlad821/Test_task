import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Як до вас звертатися?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Будь ласка, укажіть ваше ім`я для\nперсоналізації сервісу.',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RFDewi',
                 // Align text in the center
                ),
                  textAlign:
                                  TextAlign.center, 
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              cursorColor: const Color(0xFF0CBA70),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(
                    color: Color(0xFF0CBA70),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(
                    color: Color(0xFF0CBA70),
                  ),
                ),
                hintText: 'Ваше ім\'я',
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                // Simulate navigation delay
                Future.delayed(const Duration(seconds:1 ), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(name: nameController.text),
                    ),
                  ).then((_) {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0CBA70)),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 47),
                ),
              ),
              child: _isLoading
                  ? Container(
                    height: 15,
                    width: 15,
                    child: const CircularProgressIndicator(
                       strokeWidth : 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                  )
                  : const Text(
                      'Продовжити',
                      style: TextStyle(color: Colors.white, fontFamily: 'SFPro'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
