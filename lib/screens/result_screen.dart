import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vegetable_scanner/auth/login_page.dart.dart';
import 'package:vegetable_scanner/screens/home_screen.dart';
import 'package:vegetable_scanner/utils/colors.dart';
import 'package:vegetable_scanner/widgets/text_widget.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBCE32),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: TextBold(text: 'Result', fontSize: 18, color: Colors.white),
        leading: IconButton(
            onPressed: (() {
              Fluttertoast.showToast(msg: 'Added to recent scans');
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              color: Color(0xffCBCE32),
            ),
            child: Image.asset('assets/images/sample1.png'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextBold(
                          text: 'Chayote', fontSize: 26, color: Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      TextRegular(
                          text:
                              '(Sechium edule), also known as mirliton and choko, is an edible plant belonging to the gourd family, Cucurbitaceae. ',
                          fontSize: 14,
                          color: Colors.black),
                      SizedBox(
                        height: 20,
                      ),
                      TextRegular(
                          text: 'Weather Season',
                          fontSize: 16,
                          color: Colors.black),
                      TextRegular(
                          text: '•  Sunny/Rainy',
                          fontSize: 14,
                          color: Colors.black),
                      SizedBox(
                        height: 20,
                      ),
                      TextRegular(
                          text: 'Recommendation',
                          fontSize: 16,
                          color: Colors.black),
                      TextRegular(
                          text:
                              '•  Chayote squash with tomato and green chilies',
                          fontSize: 14,
                          color: Colors.black),
                      TextRegular(
                          text: '•  Spicy pan-roasted chayote squash',
                          fontSize: 14,
                          color: Colors.black),
                      SizedBox(
                        height: 20,
                      ),
                      TextRegular(
                          text: 'How to plant',
                          fontSize: 16,
                          color: Colors.black),
                      TextRegular(
                          text:
                              '•  Chayote is a warm-season, tender perennial. Plant the whole fruit 3 to 4 weeks after the last average frost date in spring when the weather has warmed.',
                          fontSize: 14,
                          color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
