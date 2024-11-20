import 'package:flutter/material.dart';
import 'package:mauistore_mobile/screens/list_product.dart';
import 'package:mauistore_mobile/screens/login.dart';
import 'package:mauistore_mobile/screens/product_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
      child: ElevatedButton(
        onPressed: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol $text!")));
          if (text == 'Lihat Daftar Produk') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage(),
                ));
          } else if (text == 'Tambah Produk') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductForm(),
                ));
          } else if (text == 'Logout') {
            final response = await request.logout(
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
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
