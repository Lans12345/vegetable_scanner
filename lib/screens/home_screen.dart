import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localstore/localstore.dart';
import 'package:tflite/tflite.dart';
import 'package:vegetable_scanner/auth/login_page.dart.dart';
import 'package:vegetable_scanner/screens/result_screen.dart';
import 'package:vegetable_scanner/services/data/crop_data.dart';
import 'package:vegetable_scanner/services/data/crop_list.dart';
import 'package:vegetable_scanner/utils/colors.dart';
import 'package:vegetable_scanner/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
    loadModel();
  }

  final db = Localstore.instance;

  var hasLoaded = false;

  List<String> crops = [];

  late List datas = [];

  getData() async {
    final items = await db.collection('Crop').get();

    if (items != null) {
      items.forEach((key, value) {
        if (cropList.contains(value['name'])) {
          crops.add(value['name']);

          var data = cropData
              .where((element) => element["Name"] == value['name'])
              .toList();

          datas.add(data);
        }
      });
    }

    setState(() {
      hasLoaded = true;
    });
  }

  late String output = '';

  late File pickedImage;

  bool isImageLoaded = false;

  late List result;

  late String accuracy = '';

  late String name = '';

  late String numbers = '';

  GetStorage box = GetStorage();

  getImageCamera(String imgsrc) async {
    var tempStore = await ImagePicker().getImage(
        source: imgsrc == 'gallery' ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
      applyModel(File(tempStore.path));
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model/model_unquant.tflite',
        labels: 'assets/model/labels.txt');
  }

  applyModel(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      result = res!;
      print('result:$result');
      String str = result[0]['label'];

      name = str.substring(2);
      accuracy = result != null
          ? '${(result[0]['confidence'] * 100.0).toString().substring(0, 2)}%'
          : '';
    });

    if (name == 'Banana') {
      box.write('data', box.read('cropData')[0]);
    } else if (name == 'Bell Pepper') {
      box.write('data', box.read('cropData')[1]);
    } else if (name == 'Cabbage') {
      box.write('data', box.read('cropData')[2]);
    } else if (name == 'Carrot') {
      box.write('data', box.read('cropData')[3]);
    } else if (name == 'Chilli Pepper') {
      box.write('data', box.read('cropData')[4]);
    } else if (name == 'Corn') {
      box.write('data', box.read('cropData')[5]);
    } else if (name == 'Cucumber') {
      box.write('data', box.read('cropData')[6]);
    } else if (name == 'Eggplant') {
      box.write('data', box.read('cropData')[7]);
    } else if (name == 'Garlic') {
      box.write('data', box.read('cropData')[8]);
    } else if (name == 'Ginger') {
      box.write('data', box.read('cropData')[9]);
    } else if (name == 'Lettuce') {
      box.write('data', box.read('cropData')[10]);
    } else if (name == 'Onion') {
      box.write('data', box.read('cropData')[11]);
    } else if (name == 'Peas') {
      box.write('data', box.read('cropData')[12]);
    } else if (name == 'Potato') {
      box.write('data', box.read('cropData')[13]);
    } else if (name == 'Raddish') {
      box.write('data', box.read('cropData')[14]);
    } else if (name == 'Spinach') {
      box.write('data', box.read('cropData')[15]);
    } else if (name == 'Sweet Potato') {
      box.write('data', box.read('cropData')[16]);
    } else if (name == 'Tomato') {
      box.write('data', box.read('cropData')[17]);
    } else {
      box.write('data', box.read('cropData')[18]);
    }
    Fluttertoast.showToast(msg: 'Plant scanned ${name}');
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ResultScreen()));
  }

  @override
  Widget build(BuildContext context) {
    print(box.read('cropData')[1]['Weather Season']);

    return hasLoaded
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: primary,
              title: TextBold(
                  text: 'Recent Scans', fontSize: 18, color: Colors.white),
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
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
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
                                                  LoginScreen()));
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
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              ],
              leading: IconButton(
                  onPressed: (() {
                    getImageCamera('camera');
                  }),
                  icon: const Icon(
                    Icons.qr_code_scanner_rounded,
                    color: Colors.white,
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: crops.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
                            child: GestureDetector(
                              onTap: (() {
                                box.write('crop', crops[index]);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ResultScreen()));
                              }),
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/sample1.png'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextBold(
                                              text: cropList[index],
                                              fontSize: 14,
                                              color: Colors.black),
                                          SizedBox(
                                            width: 150,
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
                                ),
                              ),
                            ),
                          );
                        }));
                  }),
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
