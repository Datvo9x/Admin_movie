import 'package:admin_movie/user_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data_screen.dart';

class Feeddd extends StatefulWidget {
  const Feeddd({Key? key}) : super(key: key);

  @override
  _FeedddState createState() => _FeedddState();
}

class _FeedddState extends State<Feeddd> {
  CollectionReference getmovie =
      FirebaseFirestore.instance.collection("feddback");

  // finaldelete(String document) {
  //   getmovie.doc(document).delete();
  // }
  int meo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 87, 73, 211),
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              Image.asset('images/trending.png', height: 40),
              const Text(
                '  Quản Lý Ứng Dụng Phim',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Container(
              height: 30,
              width: 120,
              alignment: Alignment.center,
              child: const Text(
                'DANH SÁCH PHIM',
                style: TextStyle(
                    color: Color.fromARGB(234, 229, 229, 229), fontSize: 14),
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
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              width: 4,
              color: const Color.fromARGB(255, 235, 235, 235),
            ),
          ),
          TextButton(
            child: Container(
              height: 30,
              width: 60,
              alignment: Alignment.center,
              child: const Text(
                'USER',
                style: TextStyle(
                    color: Color.fromARGB(234, 229, 229, 229), fontSize: 14),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Thongke(),
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              width: 4,
              color: const Color.fromARGB(255, 235, 235, 235),
            ),
          ),
          TextButton(
            child: Container(
              height: 30,
              width: 85,
              alignment: Alignment.center,
              child: const Text(
                'LƯỢT GÓP Ý',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Feeddd(),
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              width: 4,
              color: const Color.fromARGB(255, 215, 215, 215),
            ),
          ),
         TextButton(
            child: Container(
              height: 30,
              width: 80,
              alignment: Alignment.center,
              child: const Text(
                'THỐNG KÊ',
                style: TextStyle(
                    color: Color.fromARGB(234, 229, 229, 229), fontSize: 14),
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
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(150, 0, 150, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: SizedBox(
                  child: Text(
                    'Tất cả góp ý',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 6, 142, 170),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 120,
                        child: Text(
                          'Tên ',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 180,
                        child: Text(
                          'Gmail',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 130,
                        child: Text(
                          'Ngày tải',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          'Vấn đề',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 450,
                        child: Text(
                          'Nội dung',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 550,
                color: Colors.white,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('feedback')
                      .orderBy("time", descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox(
                        height: 550,
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, index) {
                        DateTime dateTime =
                            snapshot.data!.docs[index]['time'].toDate();
                        DocumentSnapshot thke = snapshot.data!.docs[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 120,
                                    child: Text(
                                      thke['name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 180,
                                    child: Text(
                                      thke['email'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 130,
                                    child: Text(
                                      '${dateTime.day} / ${dateTime.month} / ${dateTime.year}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 150,
                                    child: Text(
                                      thke['vde'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 450,
                                    child: Text(
                                      thke['nd'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 0.5,
                              color: const Color.fromARGB(255, 190, 190, 190),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
