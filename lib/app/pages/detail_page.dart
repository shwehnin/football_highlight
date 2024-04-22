import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:football_highlight/app/models/football_highlight.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DetailPage extends StatelessWidget {
  final FootballModel highlights;
  const DetailPage({super.key, required this.highlights});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(highlights.title.toString()),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              _launchUrl();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // VideoWidget(videos: highlights.videos!),
          ListView.builder(
              shrinkWrap: true,
              itemCount: highlights.videos?.length,
              itemBuilder: (ctx, idx) {
                return Container(
                  height: 200,
                  child: HtmlWidget(
                    highlights.videos![idx].embed!,
                    enableCaching: true,
                    buildAsync: true,
                    renderMode: RenderMode.column,
                  ),
                );
              }),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  highlights.title.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(highlights.competition.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(highlights.competitionUrl.toString()))) {
      throw Exception('Could not launch ${highlights.competitionUrl}');
    }
  }
}
