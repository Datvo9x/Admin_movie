import 'package:admin_movie/user_screen.dart';

import 'package:flutter/material.dart';

import '../data_screen.dart';

class TKKKK extends StatefulWidget {
  const TKKKK({Key? key}) : super(key: key);

  @override
  _TKKKKState createState() => _TKKKKState();
}

class _TKKKKState extends State<TKKKK> {
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
                  builder: (context) => const TKKKK(),
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
      body: Container(
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
                    fontSize: 26,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 140,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: const [
                        Text(
                          'Người dùng',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 81, 134),
                              fontSize: 22),
                        ),
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Divider(
                            height: 5,
                            color: Color.fromARGB(255, 7, 81, 134),
                          ),
                        ),
                        Text(
                          '9',
                          style: TextStyle(
                              color: Color.fromARGB(255, 37, 37, 37),
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 140,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: const [
                        Text(
                          'Số lượng phim',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 81, 134),
                              fontSize: 22),
                        ),
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Divider(
                            height: 5,
                            color: Color.fromARGB(255, 7, 81, 134),
                          ),
                        ),
                        Text(
                          '85',
                          style: TextStyle(
                              color: Color.fromARGB(255, 37, 37, 37),
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 140,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: const [
                        Text(
                          'Lượt truy cập',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 81, 134),
                              fontSize: 22),
                        ),
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Divider(
                            height: 5,
                            color: Color.fromARGB(255, 7, 81, 134),
                          ),
                        ),
                        Text(
                          '345',
                          style: TextStyle(
                              color: Color.fromARGB(255, 37, 37, 37),
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: 140,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: const [
                        Text(
                          'Tổng lượt xem',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 81, 134),
                              fontSize: 22),
                        ),
                        Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Divider(
                            height: 5,
                            color: Color.fromARGB(255, 7, 81, 134),
                          ),
                        ),
                        Text(
                          '245',
                          style: TextStyle(
                              color: Color.fromARGB(255, 37, 37, 37),
                              fontSize: 22),
                        ),
                      ],
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
}
