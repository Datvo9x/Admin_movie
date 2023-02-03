import 'package:admin_movie/data_screen.dart';
import 'package:admin_movie/update_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tiengviet/tiengviet.dart';

class CloudFirestoreSearch extends StatefulWidget {
  const CloudFirestoreSearch({Key? key}) : super(key: key);

  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String seach = "";
  CollectionReference getmovie = FirebaseFirestore.instance.collection("movie");
  finaldelete(String document) {
    getmovie.doc(document).delete();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 87, 73, 211),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Text(
                'Tìm Phim',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        leadingWidth: 150,
        titleSpacing: 10,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            style: const TextStyle(
              color: Color.fromARGB(179, 31, 31, 31),
            ),
            decoration: const InputDecoration(
              prefixIcon:
                  Icon(Icons.search, color: Color.fromARGB(179, 31, 31, 31)),
              hintText: 'Tên phim | Thể loại | Tác giả...',
              hintStyle: TextStyle(color: Color.fromARGB(179, 31, 31, 31)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            onChanged: (val) {
              setState(() {
                seach = val;
              });
            },
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 219, 217, 217),
        child: StreamBuilder<QuerySnapshot>(
          stream: getmovie.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (seach.isEmpty) {
                return Container(
                  color: const Color.fromARGB(255, 255, 253, 253),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot<Object?>? data =
                        snapshot.data?.docs[index];
                    if ((TiengViet.parse(data!['title'])
                            .toString()
                            .toLowerCase()
                            .contains(seach.toLowerCase())) ||
                        (TiengViet.parse(data['category'])
                            .toString()
                            .toLowerCase()
                            .contains(seach.toLowerCase())) ||
                        (TiengViet.parse(data['country'])
                            .toString()
                            .toLowerCase()
                            .contains(seach.toLowerCase())) ||
                        TiengViet.parse(data['2018'])
                            .toString()
                            .toLowerCase()
                            .contains(seach.toLowerCase())) {
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
                                    image: NetworkImage(data['imageUrl']),
                                  ),
                                ),
                                width: 200,
                                height: 130,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          width: 360,
                                          child: Text(
                                            data['title'],
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
                                          'Duration:  ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          data['duration'],
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
                                          data['year'],
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
                                          data['rating'],
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
                                          'Category:  ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 360,
                                          child: Text(
                                            data['category'],
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
                                          'Description:  ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 360,
                                          child: Text(
                                            data['description'],
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
                                          width: 360,
                                          child: Text(
                                            data['imageUrl'],
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
                                          width: 360,
                                          child: Text(
                                            data['trailer'],
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
                              SizedBox(
                                width: 60,
                                child: Column(
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
                                                finaldelete(snapshot
                                                    .data!.docs[index].id);
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
                                                style: TextStyle(
                                                    color: Colors.red),
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
                                                height: 640,
                                                width: 1120,
                                                child: UpdateMovie(
                                                  id: snapshot
                                                      .data!.docs[index].id,
                                                  title: snapshot.data!
                                                      .docs[index]['title'],
                                                  category: snapshot.data!
                                                      .docs[index]['category'],
                                                  description:
                                                      snapshot.data!.docs[index]
                                                          ['description'],
                                                  duration: snapshot.data!
                                                      .docs[index]['duration'],
                                                  imageUrl: snapshot.data!
                                                      .docs[index]['imageUrl'],
                                                  rating: snapshot.data!
                                                      .docs[index]['rating'],
                                                  trailer: snapshot.data!
                                                      .docs[index]['trailer'],
                                                  year: data['year'],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
