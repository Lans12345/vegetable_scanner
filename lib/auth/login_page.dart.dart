import 'package:flutter/material.dart';
import 'package:vegetable_scanner/auth/signup_page.dart.dart';
import 'package:vegetable_scanner/screens/home_screen.dart';
import 'package:vegetable_scanner/widgets/button_widget.dart';
import 'package:vegetable_scanner/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/veges.png',
              fit: BoxFit.cover,
            ),
            TextBold(
                text: 'Vegetables', fontSize: 42, color: Color(0xff4E7B02)),
            TextBold(text: 'Scanner', fontSize: 42, color: Color(0xff4E7B02)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Align(
                alignment: Alignment.bottomLeft,
                child:
                    TextBold(text: 'Login', fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Card(
                elevation: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    onChanged: ((value) {}),
                    decoration: InputDecoration(
                        prefixText: '',
                        border: InputBorder.none,
                        hintText: '    Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'QRegular',
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Card(
                elevation: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextFormField(
                    onChanged: ((value) {}),
                    decoration: InputDecoration(
                        prefixText: '',
                        border: InputBorder.none,
                        hintText: '    Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'QRegular',
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 150,
                  child: ButtonWidget(
                      onPressed: (() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }),
                      text: 'Login'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextRegular(
                    text: 'No Account?', fontSize: 12, color: Colors.grey),
                TextButton(
                    onPressed: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                    }),
                    child: TextBold(
                        text: 'Create now', fontSize: 14, color: Colors.black))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
