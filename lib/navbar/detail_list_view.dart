import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailListView extends StatelessWidget {
  final Map<String, dynamic> itemBerita;
  const DetailListView(this.itemBerita, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemBerita['judul'])),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(
                  itemBerita['gambar'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              SizedBox(height: 15),
              Text(itemBerita["judul"]),
              Text(itemBerita["tanggal"]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RatingBarIndicator(
                    rating: itemBerita['rating'],
                    itemBuilder:
                        (context, index) =>
                            Icon(Icons.star, color: Colors.yellow),
                    itemCount: 5,
                    itemSize: 15,
                  ),
                  SizedBox(width: 20),
                ],
              ),
              Text(itemBerita['isi'])
            ],
          ),
        ),
      ),
    );
  }
}
