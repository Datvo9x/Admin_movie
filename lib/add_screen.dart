import 'dart:typed_data';
import 'package:admin_movie/data_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddDataPhim extends StatefulWidget {
  const AddDataPhim({Key? key}) : super(key: key);

  @override
  State<AddDataPhim> createState() => _AddDataPhimState();
}

class _AddDataPhimState extends State<AddDataPhim> {
  late String? _filename, _filename1;

  FilePickerResult? results, results1;

  Uint8List? selectFile, selectFile1;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();

  final TextEditingController duration = TextEditingController();

  final TextEditingController year = TextEditingController();

  final TextEditingController rating = TextEditingController();

  final TextEditingController description = TextEditingController();

  final TextEditingController imageUrl = TextEditingController();

  final TextEditingController country = TextEditingController();

  final TextEditingController category = TextEditingController();

  final TextEditingController trailer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 73, 211),
        title: const Text('Thêm Phim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: 900,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10, 20, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Tên",
                            ),
                            controller: title,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Thể loại"),
                            controller: category,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Quốc gia"),
                            controller: country,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Thời lượng"),
                            controller: duration,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Năm phát hành"),
                            controller: year,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Số sao"),
                            controller: rating,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Mô tả"),
                            controller: description,
                            maxLines: 4,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Trailer"),
                            controller: trailer,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 13, 93, 214),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Text(
                                'Hủy',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            // onPressed: uploadFile,
                            onPressed: () async {
                              if (title.text == '' ||
                                  duration.text == '' ||
                                  year.text == '' ||
                                  rating.text == '' ||
                                  category.text == '' ||
                                  description.text == '') {
                                _showNot(context);
                              } else {
                                if (results != null) {
                                  final _path = results!.files.first.bytes;
                                  // final _path1 = results1!.files.first.bytes;
                                  final Reference firestorageRef =
                                      FirebaseStorage.instance
                                          .ref()
                                          .child('movie/$_filename');
                                  // final Reference firestorageRef1 =
                                  //     FirebaseStorage.instance
                                  //         .ref()
                                  //         .child('movie/$_filename1');
                                  await firestorageRef.putData(_path!);
                                  // await firestorageRef1.putData(_path1!);

                                  final downloadUrl =
                                      await firestorageRef.getDownloadURL();
                                  // final downloadUrl1 =
                                  //     await firestorageRef1.getDownloadURL();
                                  setState(
                                    () {
                                      FirebaseFirestore.instance
                                          .collection("movie")
                                          .add(
                                        {
                                          "title": title.text,
                                          "duration": duration.text,
                                          "year": year.text,
                                          "rating": rating.text,
                                          "description": description.text,
                                          "category": category.text,
                                          "imageUrl": downloadUrl,
                                          "country": country.text,
                                          "trailer":
                                              'https://firebasestorage.googleapis.com/v0/b/movieapp-f4f6d.appspot.com/o/movie%2FAlita-%20Battle%20Angel%20-%20Official%20Trailer%20%5BHD%5D%20-%2020th%20Century%20FOX.mp4?alt=media&token=fd08acce-8bce-4bd1-8ece-bd1cb03d6368',
                                          "view": 0,
                                        },
                                      );
                                      _showOK(context);
                                    },
                                  );
                                } else {
                                  _showNotImage(context);
                                }
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 93, 5, 235),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Text(
                                'Thêm',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: (selectFile == null)
                      ? const SizedBox(
                          height: 230,
                          width: 160,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(pickedFile!.name),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5),
                              child: Image.memory(
                                selectFile!,
                                height: 220,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: TextButton(
                    onPressed: () async {
                      await choseImage(context);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 13, 93, 214),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                      child: const Text(
                        '  Chọn ảnh Phim  ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: (selectFile1 == null)
                        ? const SizedBox(
                            height: 160,
                            width: 160,
                          )
                        : SizedBox(
                            height: 160,
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 8),
                                  child: Text(
                                    _filename1!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Image.asset(
                                  'images/videoIcon.png',
                                  width: 120,
                                  height: 90,
                                ),
                                // Image.memory(
                                //   selectFile!,
                                //   height: 150,
                                //   width: 160,
                                //   fit: BoxFit.cover,
                                // ),
                              ],
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    onPressed: () async {
                      await choseVideo(context);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 13, 93, 214),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                      child: const Text(
                        'Chọn Video Phim',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future choseImage(context) async {
    try {
      results = (await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg'],
      ));

      setState(() {
        _filename = results!.files.single.name;
        selectFile = results!.files.first.bytes;
      });

      return _filename;
    } catch (e) {
      print(e);
    }
  }

  Future choseVideo(context) async {
    try {
      results1 = (await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['mp4', 'mkv'],
      ));

      setState(() {
        _filename1 = results1!.files.single.name;
        selectFile1 = results1!.files.first.bytes;
      });

      return _filename1;
    } catch (e) {
      print(e);
    }
  }

  void _showNotImage(BuildContext context) {
    showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Vui lòng thêm ảnh !'),
        actions: <Widget>[
          TextButton(
            child: Container(
              height: 30,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 13, 93, 214),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Trở lại',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      context: context,
    );
  }

  void _showNot(BuildContext context) {
    showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Vui lòng nhập đủ các trường !'),
        actions: <Widget>[
          TextButton(
            child: Container(
              height: 30,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 13, 93, 214),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Đồng ý',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      context: context,
    );
  }

  void _showOK(BuildContext context) {
    showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Thêm Thành Công !'),
        actions: <Widget>[
          TextButton(
            child: Container(
              height: 30,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 13, 93, 214),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Đồng ý',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DataScreen(),
                ),
              );
            },
          )
        ],
      ),
      context: context,
    );
  }
}
