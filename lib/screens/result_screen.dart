import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localstore/localstore.dart';
import 'package:vegetable_scanner/auth/login_page.dart.dart';
import 'package:vegetable_scanner/screens/home_screen.dart';
import 'package:vegetable_scanner/services/data/crop_list.dart';
import 'package:vegetable_scanner/utils/colors.dart';
import 'package:vegetable_scanner/widgets/text_widget.dart';

class ResultScreen extends StatefulWidget {
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  GetStorage box = GetStorage();

  final db = Localstore.instance;

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
              final id = db.collection('Crop').doc().id;

              db.collection('Crop').doc(id).set({
                'name': box.read('data')['Name'],
                'image': box.read('data')['image'],
                'desc': box.read('data')['Description'],
                'id': id
              });
              Fluttertoast.showToast(msg: 'Added to recent scans');
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
            child: Image.asset(box.read('data')['image']),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 800,
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
                          text: box.read('data')['Name'],
                          fontSize: 26,
                          color: Colors.black),
                      SizedBox(
                        height: 10,
                      ),
                      TextRegular(
                          text: box.read('data')['Description'],
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
                          text: '•  ${box.read('data')['Weather Season']}',
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
                          text: '•  ${box.read('data')['Recommendation']}',
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
                          text: '•  ${box.read('data')['How to plant']}',
                          fontSize: 14,
                          color: Colors.black),
                      SizedBox(
                        height: 20,
                      ),
                      TextRegular(
                          text: 'Amount of soil needed',
                          fontSize: 16,
                          color: Colors.black),
                      TextRegular(
                          text:
                              '•  ${box.read('data')['Amount of soil needed']}',
                          fontSize: 14,
                          color: Colors.black),
                      SizedBox(
                        height: 20,
                      ),
                      TextRegular(
                          text: 'Amount of soil water',
                          fontSize: 16,
                          color: Colors.black),
                      TextRegular(
                          text:
                              '•  ${box.read('data')['Amount of soil water']}',
                          fontSize: 14,
                          color: Colors.black),
                      SizedBox(
                        height: 20,
                      ),
                      TextRegular(
                          text: 'Amount of soil fertilizer',
                          fontSize: 16,
                          color: Colors.black),
                      TextRegular(
                          text:
                              '•  ${box.read('data')['Amount of soil fertilizer']}',
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
