import 'package:admin_movie/feedback.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data_screen.dart';

class Thongke extends StatefulWidget {
  const Thongke({Key? key}) : super(key: key);

  @override
  _ThongkeState createState() => _ThongkeState();
}

class _ThongkeState extends State<Thongke> {
  CollectionReference getmovie = FirebaseFirestore.instance.collection("users");

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
              width: 70,
              alignment: Alignment.center,
              child: const Text(
                'USER',
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
              width: 85,
              alignment: Alignment.center,
              child: const Text(
                'LƯỢT GÓP Ý',
                style: TextStyle(
                    color: Color.fromARGB(234, 229, 229, 229), fontSize: 14),
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
                'ĐĂNG XUẤT',
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
                    'Thống kê',
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
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 30,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          'Name',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          'ID',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          'Ngày tạo',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          'Giới tính',
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
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: 350,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 210,
                              child: Text(
                                'Trạng thái',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              'Quản lý',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
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
                      .collection('users')
                      .orderBy('nickname', descending: true)
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
                            snapshot.data!.docs[index]['createdAt'].toDate();
                        DocumentSnapshot thke = snapshot.data!.docs[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 30,
                                    child: Text(
                                      '',
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
                                  padding: const EdgeInsets.all(12),
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      thke['nickname'],
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
                                    width: 250,
                                    child: Text(
                                      thke['id'],
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
                                    width: 100,
                                    child: Text(
                                      thke['sex'],
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
                                    width: 350,
                                    height: 30,
                                    child: StreamBuilder(
                                      stream: getmovie
                                          .where('id', isEqualTo: thke['id'])
                                          .snapshots(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: Container(),
                                          );
                                        } else {
                                          return (snapshot.data!.docs
                                                      .first['type'] ==
                                                  true)
                                              ? Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        'Đang bị khóa',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    222,
                                                                    28,
                                                                    28),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          builder: (context) =>
                                                              AlertDialog(
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    18.0),
                                                              ),
                                                            ),
                                                            title: const Center(
                                                              child: Text(
                                                                'Mở khóa người dùng ?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            actions: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    GestureDetector(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            85,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        decoration: BoxDecoration(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                223,
                                                                                131,
                                                                                10),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20)),
                                                                        child:
                                                                            const Text(
                                                                          'Không',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                    GestureDetector(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            85,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        decoration: BoxDecoration(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                232,
                                                                                230,
                                                                                228),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20)),
                                                                        child:
                                                                            const Text(
                                                                          'Xác nhận',
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(255, 215, 98, 30),
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () async {
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection("users")
                                                                            .doc(thke['id'])
                                                                            .set({
                                                                          'type':
                                                                              false,
                                                                        }, SetOptions(merge: true));

                                                                        Navigator.pop(
                                                                            context);
                                                                        // _showOK(
                                                                        //     context,
                                                                        //     'Đã xóa khỏi yêu thích');
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          context: context,
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.lock,
                                                        size: 16,
                                                        color: Color.fromARGB(
                                                            255, 227, 33, 33),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Dialog(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ), //this right here
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      30.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              height: 450,
                                                              width: 380,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 120,
                                                                    width: 120,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image:
                                                                            NetworkImage(
                                                                          thke[
                                                                              'photoUrl'],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Tên user',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        thke[
                                                                            "nickname"],
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'ID',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            Text(
                                                                          thke[
                                                                              "id"],
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              const TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Ngày tạo',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${dateTime.day} / ${dateTime.month} / ${dateTime.year}',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Giới tính',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        thke[
                                                                            "sex"],
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Trạng thái',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      (thke["type"] ==
                                                                              false)
                                                                          ? const Text(
                                                                              "Đang hoạt động",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                color: Color.fromARGB(221, 23, 177, 110),
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            )
                                                                          : const Text(
                                                                              "Đang khóa",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                color: Color.fromARGB(221, 227, 39, 39),
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .ios_share_outlined,
                                                        size: 16,
                                                        color: Color.fromARGB(
                                                            255, 11, 144, 201),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        size: 16,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        'Đang hoạt động',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    14,
                                                                    140,
                                                                    71),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          builder: (context) =>
                                                              AlertDialog(
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    18.0),
                                                              ),
                                                            ),
                                                            title: const Center(
                                                              child: Text(
                                                                'Khóa người dùng ?',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            actions: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    GestureDetector(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            85,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        decoration: BoxDecoration(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                223,
                                                                                131,
                                                                                10),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20)),
                                                                        child:
                                                                            const Text(
                                                                          'Không',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                    GestureDetector(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            85,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        decoration: BoxDecoration(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                232,
                                                                                230,
                                                                                228),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20)),
                                                                        child:
                                                                            const Text(
                                                                          'Vẫn khóa',
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(255, 215, 98, 30),
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () async {
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection("users")
                                                                            .doc(thke['id'])
                                                                            .set({
                                                                          'type':
                                                                              true,
                                                                        }, SetOptions(merge: true));

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          context: context,
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.lock,
                                                        size: 16,
                                                        color: Color.fromARGB(
                                                            255, 9, 148, 150),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Dialog(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ), //this right here
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      30.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              height: 450,
                                                              width: 380,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 120,
                                                                    width: 120,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image:
                                                                            NetworkImage(
                                                                          thke[
                                                                              'photoUrl'],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Tên user',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        thke[
                                                                            "nickname"],
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'ID',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            200,
                                                                        child:
                                                                            Text(
                                                                          thke[
                                                                              "id"],
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              const TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Ngày tạo',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${dateTime.day} / ${dateTime.month} / ${dateTime.year}',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Giới tính',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        thke[
                                                                            "sex"],
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      const SizedBox(
                                                                        width:
                                                                            120,
                                                                        child:
                                                                            Text(
                                                                          'Trạng thái',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      (thke["type"] ==
                                                                              false)
                                                                          ? const Text(
                                                                              "Đang hoạt động",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                color: Color.fromARGB(221, 23, 177, 110),
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            )
                                                                          : const Text(
                                                                              "Đang khóa",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                color: Color.fromARGB(221, 227, 39, 39),
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .ios_share_outlined,
                                                        size: 16,
                                                        color: Color.fromARGB(
                                                            255, 11, 144, 201),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        size: 16,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                        }
                                      },
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
