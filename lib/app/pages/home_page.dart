import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:football_highlight/app/api/api.dart';
import 'package:football_highlight/app/pages/detail_page.dart';
import 'package:football_highlight/app/models/football_highlight.dart';
import 'package:football_highlight/app/pages/components/football_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FootballModel> footballHighlits = [];
  bool isLoading = false;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    isLoading = true;
    var highlights = await Api.getFootballHighlights(1);
    setState(() {
      footballHighlits = highlights;
      isLoading = false;
    });
  }

  Future<bool> loadmoreData() async {
    currentPage++;
    var highlights = await Api.getFootballHighlights(currentPage);
    if (highlights.isEmpty) {
      return false;
    } else {
      setState(() {
        footballHighlits.addAll(highlights);
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text("Football Highlight (${footballHighlits.length})"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : footballHighlits.isEmpty
              ? const Center(
                  child: Text('No Data'),
                )
              : LoadMore(
                  isFinish: false,
                  onLoadMore: loadmoreData,
                  child: ListView.builder(
                    itemCount: footballHighlits.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            highlights: footballHighlits[index],
                          ),
                        ),
                      ),
                      child: FootballCard(
                        footballModel: footballHighlits[index],
                      ),
                    ),
                  ),
                ),
    );
  }
}
