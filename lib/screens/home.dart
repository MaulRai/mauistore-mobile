import 'package:flutter/material.dart';
import 'package:mauistore_mobile/widgets/buttons.dart';
import 'package:mauistore_mobile/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: const IconThemeData(color: Colors.white),
        // backgroundColor: Colors.blue,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SnackBarButton(text: 'Lihat Daftar Produk', color: Colors.blue.shade200),
          SnackBarButton(text: 'Tambah Produk', color: Colors.limeAccent),
          SnackBarButton(text: 'Logout', color: Colors.orangeAccent),
        ],
      ),
    );
  }
}


