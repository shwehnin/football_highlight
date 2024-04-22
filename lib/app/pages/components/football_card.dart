import 'package:flutter/material.dart';
import 'package:football_highlight/app/models/football_highlight.dart';

class FootballCard extends StatelessWidget {
  final FootballModel footballModel;
  const FootballCard({super.key, required this.footballModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Card(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Image.network(
                footballModel.thumbnail.toString(),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                footballModel.title.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
