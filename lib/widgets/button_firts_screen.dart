import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/second_screen.dart';

class MyButton extends StatefulWidget {
  final TextEditingController nameController;

  const MyButton({Key? key, required this.nameController}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isLoading = true; // Set loading state
        });

        // Simulate navigation delay
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(name: widget.nameController.text),
            ),
          );
        }).then((_) {
          setState(() {
            _isLoading = false; // Reset loading state after navigation
          });
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0CBA70)),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 47), // Adjust the height as needed
        ),
      ),
      child: _isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : const Text(
              'Продовжити',
              style: TextStyle(color: Colors.white, fontFamily: 'SFPro'),
            ),
    );
  }
}
