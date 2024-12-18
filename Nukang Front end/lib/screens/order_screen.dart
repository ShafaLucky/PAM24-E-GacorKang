import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final int tukangId;

  OrderScreen({required this.tukangId});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void _submitOrder() {
    String description = _descriptionController.text;
    String location = _locationController.text;

    if (description.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap lengkapi semua field')),
      );
      return;
    }

    // Proses order di backend (API call)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pesanan berhasil dibuat!')),
    );

    // Reset form
    _descriptionController.clear();
    _locationController.clear();

    // Kembali ke halaman sebelumnya
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesan Tukang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi Pekerjaan',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Lokasi Pekerjaan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitOrder,
              child: Text('Kirim Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
