import 'package:flutter/material.dart';
import '../models/tukang_model.dart';

class TukangDetailScreen extends StatelessWidget {
  final Tukang tukang;

  TukangDetailScreen({required this.tukang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tukang.nama)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${tukang.nama}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Keahlian: ${tukang.keahlianUtama}'),
            SizedBox(height: 10),
            Text('Rating: ${tukang.ratingKeahlian}'),
          ],
        ),
      ),
    );
  }
}
