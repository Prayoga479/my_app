import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Sewa Jas Singaraja',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildMotorCard(
              context,
              'Jas Blazer Pria Modern',
              'Rp 70.000/hari',
              'assets/images/icon5_flutter.png',
              'https://www.google.com',
            ),
            SizedBox(height: 20),
            _buildMotorCard(
              context,
              'Jas Blazer Wanita Modern',
              'Rp 70.000/hari',
              'assets/images/icon6_flutter.png',
              'https://www.google.com',
            ),
            SizedBox(height: 20),
            _buildMotorCard(
              context,
              'Jas Motif Kotak',
              'Rp 70.000/hari',
              'assets/images/icon4_flutter.png',
              'https://www.google.com',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMotorCard(
      BuildContext context, String brand, String price, String image, String websiteLink) {
    return InkWell(
      onTap: () => _launchWebsite(websiteLink),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(image, height: 200, fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brand,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Harga Sewa: $price',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_copy, color: Colors.white),
                    SizedBox(width: 5),
                    Text('Lihat Detail', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}