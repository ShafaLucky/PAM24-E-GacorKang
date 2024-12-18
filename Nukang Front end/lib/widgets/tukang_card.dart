import 'package:flutter/material.dart';
import '../models/tukang_model.dart';

class TukangCard extends StatelessWidget {
  final Tukang tukang;
  final VoidCallback onTap;

  TukangCard({required this.tukang, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(tukang.nama),
        subtitle: Text('Rating: ${tukang.ratingKeahlian}'),
        onTap: onTap,
      ),
    );
  }
}
