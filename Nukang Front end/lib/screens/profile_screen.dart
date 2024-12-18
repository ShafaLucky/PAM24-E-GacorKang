import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class ProfileScreen extends StatefulWidget {
  final int userId;

  ProfileScreen({required this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User> user;

  @override
  void initState() {
    super.initState();
    user = ApiService.fetchUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil Saya')),
      body: FutureBuilder<User>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Data tidak ditemukan.'));
          } else {
            User userData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userData.saldoDompet > 0
                        ? 'https://example.com/avatar.png'
                        : 'https://example.com/default-avatar.png'),
                  ),
                  SizedBox(height: 20),
                  Text('Nama: ${userData.nama}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Email: ${userData.email}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('No HP: ${userData.noHp}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('Alamat: ${userData.alamat}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text(
                    'Saldo Dompet: Rp ${userData.saldoDompet.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
