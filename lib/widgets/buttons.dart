import 'package:flutter/material.dart';
import 'package:mauistore_mobile/screens/product_screen.dart';

class SnackBarButton extends StatelessWidget {
  final String text;
  final Color color;

  const SnackBarButton({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol $text!")));
          if (text == 'Lihat Daftar Produk') {
            
          } else if (text == 'Tambah Produk') {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductScreen(),
                  ));
          } else if (text == 'Logout') {
            
          } 
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(color),
        ),
        child: Text(text),
      ),
    );
  }
}
