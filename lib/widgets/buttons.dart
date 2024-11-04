import 'package:flutter/material.dart';

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
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(color),
        ),
        child: Text(text),
      ),
    );
  }
}
