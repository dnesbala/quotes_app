import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app/models/quote_model.dart';
import 'package:quotes_app/screens/quote_image_screen.dart';
import 'package:quotes_app/widgets/quote_card.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  String quote = "";
  bool isLoading = false;

  fetchQuotes() async {
    setState(() {
      isLoading = true;
    });
    final url = "https://zenquotes.io/api/random/";
    // final url = "https://jsonplaceholder.typicode.com/users";
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      final data = response.data;

      final quoteModel =
          QuoteModel.fromJson(data[0]); // data = [{}], data[0] = {}
      print(quoteModel);

      setState(() {
        quote = quoteModel.q;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Quote Images"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => QuoteImageScreen()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Quotes App"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Quote:", style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              isLoading ? CircularProgressIndicator() : QuoteCard(quote: quote),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await fetchQuotes();
        },
        child: Icon(Icons.refresh_outlined),
      ),
    );
  }
}
