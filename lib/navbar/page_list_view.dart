import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_tugas1/navbar/detail_list_view.dart';

class PageListView extends StatefulWidget {
  const PageListView({super.key});

  @override
  State<PageListView> createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  //deklarasi data list berita
  List<Map<String, dynamic>> listBerita = [
    {
      "judul": "Judul Berita satu",
      "isi":
          "Officia minim excepteur exercitation eiusmod tempor culpa enim sit.Duis sunt pariatur dolor est laborum velit ipsum laborum. Anim proident officia tempor mollit quis. Ut ad qui qui duis. Culpa enim ad ad sunt tempor quis adipisicing aute do est labore laborum velit. Irure aute proident est qui do dolor ad quis aliqua.",
      "tanggal": "15 Maret",
      "gambar": "gambar/berita1.jpeg",
      "rating": 5,
    },
    {
      "judul": "Judul Berita dua",
      "isi":
          "Officia minim excepteur exercitation eiusmod tempor culpa enim sit.Duis sunt pariatur dolor est laborum velit ipsum laborum. Anim proident officia tempor mollit quis. Ut ad qui qui duis. Culpa enim ad ad sunt tempor quis adipisicing aute do est labore laborum velit. Irure aute proident est qui do dolor ad quis aliqua.",
      "tanggal": "16 Maret",
      "gambar": "gambar/berita2.jpeg",
      "rating": 4,
    },
    {
      "judul": "Judul Berita tiga",
      "isi":
          "Officia minim excepteur exercitation eiusmod tempor culpa enim sit.Duis sunt pariatur dolor est laborum velit ipsum laborum. Anim proident officia tempor mollit quis. Ut ad qui qui duis. Culpa enim ad ad sunt tempor quis adipisicing aute do est labore laborum velit. Irure aute proident est qui do dolor ad quis aliqua.",
      "tanggal": "17 Maret",
      "gambar": "gambar/berita3.jpeg",
      "rating": 3,
    },
    {
      "judul": "Judul Berita empat",
      "isi":
          "Officia minim excepteur exercitation eiusmod tempor culpa enim sit.Duis sunt pariatur dolor est laborum velit ipsum laborum. Anim proident officia tempor mollit quis. Ut ad qui qui duis. Culpa enim ad ad sunt tempor quis adipisicing aute do est labore laborum velit. Irure aute proident est qui do dolor ad quis aliqua.",
      "tanggal": "18 Maret",
      "gambar": "gambar/berita4.jpg",
      "rating": 5,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail berita saat item diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailListView(listBerita[index]),
                  ),
                );},
            child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        listBerita[index]['gambar'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listBerita[index]['judul'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(listBerita[index]['tanggal']),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RatingBarIndicator(
                              rating: listBerita[index]['rating'],
                              itemBuilder:
                                  (context, index) =>
                                      Icon(Icons.star, color: Colors.yellow),
                              itemCount: 5,
                              itemSize: 15,
                            ),
                            SizedBox(width: 20,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            );
          },
        ),
      ),
    );
  }
}
