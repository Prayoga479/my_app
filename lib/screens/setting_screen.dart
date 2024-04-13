import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Warna latar belakang keseluruhan
      appBar: AppBar(
        elevation: 0, // Hilangkan bayangan di appbar
        backgroundColor: Colors.transparent, // Buat appbar transparan
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRecommendationSection(),
            SizedBox(height: 20),
            _buildMotorList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white, // Warna latar belakang dengan opacity
        borderRadius: BorderRadius.circular(20), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rekomendasi Sewa Jas Termurah di Singaraja',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Warna teks biru
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Dapatkan Kualitas dan Harga Terbaik di Tempat Kami',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey, // Warna teks abu-abu
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMotorList() {
    return Column(
      children: [
        _buildMotorItem(
          'assets/images/icon5_flutter.png',
          'Jas Blazer Pria Modern',
          'Rp 70.000',
          '7',
        ),
        _buildMotorItem(
          'assets/images/icon6_flutter.png',
          'Jas Blazer Wanita Modern',
          'Rp 70.000',
          '7',
        ),
        _buildMotorItem(
          'assets/images/icon4_flutter.png',
          'Jas Motif Kotak',
          'Rp 60.000',
          '7',
        ),
      ],
    );
  }

  Widget _buildMotorItem(String imagePath, String motorName, String rentalPrice, String cc) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    motorName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    rentalPrice,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue, // Warna teks biru
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Stok: $cc',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey, // Warna teks abu-abu
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}