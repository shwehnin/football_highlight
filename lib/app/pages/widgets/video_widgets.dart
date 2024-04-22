import 'package:flutter/material.dart';
import 'package:football_highlight/app/models/football_highlight.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// import 'package:flutter_html/flutter_html.dart';

class VideoWidget extends StatelessWidget {
  final List<Videos> videos;
  const VideoWidget({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            child: HtmlWidget(
              videos[index].embed.toString(),
            ),
          );
        });
  }
}
