import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String photoUrl ='https://avatars.githubusercontent.com/u/180179307?v=4';
    const String name = 'Muhammad Fauzi';
    const String email = 'm.fauzi30052004@gmail.com';
    const String telepon = '0822 8761 9351';
    const String prodi = 'D-IV Rekaya Perangkat Lunak';
    const String jurusan = 'Teknik Informatika';
    const String kampus = 'Politeknik Negeri Bengkalis';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(photoUrl),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Text(
              //   email,
              //   style: const TextStyle(
              //     color: Colors.black87,
              //     fontSize: 14,
              //   ),
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   telepon,
              //   style: const TextStyle(
              //     color: Colors.black87,
              //     fontSize: 14,
              //   ),
              // ),
              const SizedBox(height: 20),
              // InfoRow(title: 'Nama', value: name),
              InfoRow(title: 'Email', value: email),
              InfoRow(title: 'Nomor Telepon', value: telepon),
              InfoRow(title: 'Program Studi', value: prodi),
              InfoRow(title: 'Jurusan', value: jurusan),
              InfoRow(title: 'Perguruan Tinggi', value: kampus),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;

  const InfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
