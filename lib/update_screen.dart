import 'dart:typed_data';
import 'package:admin_movie/data_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpdateMovie extends StatefulWidget {
  UpdateMovie({
    Key? key,
    required this.id,
    required this.category,
    required this.description,
    required this.duration,
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.trailer,
    required this.year,
  }) : super(key: key);

  String title,
      duration,
      year,
      id,
      rating,
      description,
      imageUrl,
      category,
      trailer;

  @override
  State<UpdateMovie> createState() => _UpdateMovieState();
}

class _UpdateMovieState extends State<UpdateMovie> {
  late String? _filename, _filename1;
  FilePickerResult? results, results1;
  Uint8List? selectFile, selectFile1;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();

    final TextEditingController title =
        TextEditingController(text: widget.title);

    final TextEditingController duration =
        TextEditingController(text: widget.duration);

    final TextEditingController year = TextEditingController(text: widget.year);

    final TextEditingController rating =
        TextEditingController(text: widget.rating);

    final TextEditingController description =
        TextEditingController(text: widget.description);

    final TextEditingController imageUrl =
        TextEditingController(text: widget.imageUrl);

    final TextEditingController category =
        TextEditingController(text: widget.category);

    final TextEditingController trailer =
        TextEditingController(text: widget.trailer);

    String _image = widget.imageUrl;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 73, 211),
        title: const Text('Sửa Thông Tin'),
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
                              labelText: "Tên phim",
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
                            maxLines: 3,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 400,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Trailer"),
                                  controller: trailer,
                                  maxLines: 2,
                                  readOnly: true,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                                child: Icon(
                                  Icons.next_plan_sharp,
                                  color: Color.fromARGB(255, 85, 35, 178),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: (selectFile1 == null)
                                      ? const SizedBox(
                                          height: 60,
                                          width: 400,
                                        )
                                      : SizedBox(
                                          height: 60,
                                          width: 400,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 320,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0, bottom: 8),
                                                  child: Text(
                                                    _filename1!,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Image.asset(
                                                'images/videoIcon.png',
                                                width: 60,
                                                height: 60,
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
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
                              'Hủy bỏ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () async {
                            if (title.text == '' ||
                                duration.text == '' ||
                                description.text == '') {
                              _showNot(context);
                            } else {
                              if (results != null) {
                                final _path = results!.files.first.bytes;
                                final Reference firestorageRef = FirebaseStorage
                                    .instance
                                    .ref()
                                    .child('movie/$_filename');
                                await firestorageRef.putData(_path!);
                                final downloadUrl =
                                    await firestorageRef.getDownloadURL();
                                setState(() {
                                  _image = downloadUrl;
                                });
                                await FirebaseFirestore.instance
                                    .collection("movie")
                                    .doc(widget.id)
                                    .update(
                                  {
                                    "title": title.text,
                                    "duration": duration.text,
                                    "year": year.text,
                                    "rating": rating.text,
                                    "description": description.text,
                                    "imageUrl": _image,
                                    "category": category.text,
                                    "trailer": trailer.text,
                                    "view": 0,
                                  },
                                );
                                _showOK(context);
                              } else {
                                setState(() {
                                  _image = widget.imageUrl;
                                });
                                await FirebaseFirestore.instance
                                    .collection("movie")
                                    .doc(widget.id)
                                    .update(
                                  {
                                    "title": title.text,
                                    "duration": duration.text,
                                    "year": year.text,
                                    "rating": rating.text,
                                    "description": description.text,
                                    "imageUrl": _image,
                                    "category": category.text,
                                    "trailer": trailer.text,
                                    "view": 0,
                                  },
                                );
                                _showOK(context);
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
                              ' Sửa ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 190,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(0.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.imageUrl,
                      ),
                    ),
                  ),
                ),
                (selectFile == null)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                            child: SizedBox(
                              height: 30,
                              child: Icon(
                                Icons.next_plan_sharp,
                                color: Color.fromARGB(255, 85, 35, 178),
                              ),
                            ),
                          ),
                          Container(
                            height: 190,
                            width: 160,
                            color: const Color.fromARGB(255, 216, 216, 216),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Center(
                            child: SizedBox(
                              height: 45,
                              child: Icon(
                                Icons.next_plan_sharp,
                                color: Color.fromARGB(255, 85, 35, 178),
                              ),
                            ),
                          ),
                          // Text(pickedFile!.name),
                          Image.memory(
                            selectFile!,
                            height: 190,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    onPressed: () async {
                      await choseImage(context);
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 13, 93, 214),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                      child: const Text(
                        ' Chỉnh sửa ảnh Phim ',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: TextButton(
                    onPressed: () async {
                      await choseVideo(context);
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 13, 93, 214),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                      child: const Text(
                        'Chỉnh sửa video Phim',
                        style: TextStyle(color: Colors.white, fontSize: 15),
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
  }

  Future choseVideo(context) async {
    results1 = (await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mp4'],
    ));

    setState(() {
      _filename1 = results1!.files.single.name;
      selectFile1 = results1!.files.first.bytes;
    });

    return _filename1;
  }

  void _showNotImage(BuildContext context) {
    showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Vui lòng thêm ảnh !'),
        actions: <Widget>[
          GestureDetector(
            child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Text('Đồng ý')),
            onTap: () {
              Navigator.pop(context);
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
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 93, 214),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
              child: const Text(
                'Đồng ý',
                style: TextStyle(color: Colors.white, fontSize: 16),
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
        content: const Text('Sửa thành công !'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DataScreen(),
                ),
              );
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 93, 214),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
              child: const Text(
                'Đồng ý',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
      context: context,
    );
  }
}
