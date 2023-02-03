import 'package:admin_movie/add_screen.dart';
import 'package:admin_movie/seach_screen.dart';
import 'package:admin_movie/user_screen.dart';
import 'package:admin_movie/update_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'feedback.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  CollectionReference getmovie = FirebaseFirestore.instance.collection("movie");

  finaldelete(String document) {
    getmovie.doc(document).delete();
  }

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
              width: 125,
              alignment: Alignment.center,
              child: const Text(
                'DANH SÁCH PHIM',
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
      backgroundColor: Colors.black12,
      body: FutureBuilder(
        future: getmovie.where('category', isEqualTo: 'Viễn tưởng').get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            // ignore: curly_braces_in_flow_control_structures
            return const Center(
              child: CircularProgressIndicator(),
            );
          else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.size,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 16 / 5,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    snapshot.data!.docs[index]['imageUrl']),
                              ),
                            ),
                            width: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Title:  ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        snapshot.data!.docs[index]['title'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Duration: ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]['duration'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        'Year:  ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]['year'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        'Rating:  ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]['rating'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Description:  ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        snapshot.data!.docs[index]
                                            ['description'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'ImageUrl:  ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        snapshot.data!.docs[index]['imageUrl'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Trailer:  ',
                                      // ignore: unnecessary_const
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        snapshot.data!.docs[index]['trailer'],
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              PopupMenuButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.red[400],
                                ),
                                elevation: 2,
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      height: 30,
                                      child: GestureDetector(
                                        onTap: () {
                                          finaldelete(
                                              snapshot.data!.docs[index].id);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DataScreen(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Xóa',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      height: 30,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Hủy',
                                        ),
                                      ),
                                    ),
                                  ];
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mode_edit,
                                  size: 20,
                                  color: Colors.teal[600],
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ), //this right here
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: 630,
                                          width: 1120,
                                          child: UpdateMovie(
                                            id: snapshot.data!.docs[index].id,
                                            title: snapshot.data!.docs[index]
                                                ['title'],
                                            category: snapshot.data!.docs[index]
                                                ['category'],
                                            description: snapshot.data!
                                                .docs[index]['description'],
                                            duration: snapshot.data!.docs[index]
                                                ['duration'],
                                            imageUrl: snapshot.data!.docs[index]
                                                ['imageUrl'],
                                            rating: snapshot.data!.docs[index]
                                                ['rating'],
                                            trailer: snapshot.data!.docs[index]
                                                ['trailer'],
                                            year: snapshot.data!.docs[index]
                                                ['year'],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              elevation: 1.5,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(0.0)), //this right here
                        child: const SizedBox(
                          height: 680,
                          width: 1120,
                          child: AddDataPhim(),
                        ),
                      );
                    });
              },
              tooltip: 'Thêm',
              child: const Icon(Icons.add),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              elevation: 1.5,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(0.0)), //this right here
                        child: const SizedBox(
                          height: 650,
                          width: 800,
                          child: CloudFirestoreSearch(),
                        ),
                      );
                    });
              },
              tooltip: 'Tìm kiếm',
              child: const Icon(
                Icons.search,
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
