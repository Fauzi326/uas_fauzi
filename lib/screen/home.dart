import 'package:flutter/material.dart';
import 'package:uas_multiplatform/models/user_models.dart';
import 'package:uas_multiplatform/services/api_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar User')),
      body: FutureBuilder<List<UserData>>(
        future: ApiServices().fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Nama: ${user.firstName} ${user.lastName},\n'
                              'Email: ${user.email}',
                            ),
                          ),
                        );
                      },
                  // subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}

