import 'package:flutter/material.dart';
import 'package:vegetable_scanner/auth/login_page.dart.dart';
import 'package:vegetable_scanner/screens/result_screen.dart';
import 'package:vegetable_scanner/utils/colors.dart';
import 'package:vegetable_scanner/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title:
            TextBold(text: 'Recent Scans', fontSize: 18, color: Colors.white),
        actions: [
          IconButton(
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Logout Confirmation',
                            style: TextStyle(
                                fontFamily: 'QBold',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Are you sure you want to Logout?',
                            style: TextStyle(fontFamily: 'QRegular'),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              }),
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              )),
        ],
        leading: IconButton(
            onPressed: (() {}),
            icon: Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return ListView.builder(itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ResultScreen()));
                    }),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset('assets/images/sample1.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextBold(
                                    text: 'Chayote',
                                    fontSize: 14,
                                    color: Colors.black),
                                SizedBox(
                                  width: 180,
                                  child: TextRegular(
                                      text:
                                          '(Sechium edule), also known as mirliton and choko, is an edible plant belonging to the gourd family, Cucurbitaceae. ',
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              }));
            }),
      ),
    );
  }
}
