import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  const QuoteCard({
    Key? key,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.maxFinite,
      color: Colors.teal,
      child: Text(
        quote,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
