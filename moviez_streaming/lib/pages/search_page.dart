import 'package:flutter/material.dart';
import 'package:moviez_streaming/model/box_office_model.dart';
import 'package:moviez_streaming/sample_data/box_office_data.dart';
import 'package:moviez_streaming/utils/colors.dart';
import 'package:moviez_streaming/widgets/disney_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<BoxOfficeModel> allData = movieData;
  TextEditingController editingController = TextEditingController();

  bool isCari = true;
  String query = "";
  TextEditingController cari = TextEditingController();
  List<BoxOfficeModel> dataFilter = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: const Text("Suggest Movie"),
          ),
          backgroundColor: MyColor.buttonColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 29,
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              Container(
                child: TextField(
                  onChanged: (value) {
                    // searcMovie(editingController.text);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Movie",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  final movie = allData[index];
                  return DisneyCard(boxOfficeModel: movie);
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  void searcMovie(String query) {
    final suggestion = allData.where(
      (element) {
        final movieTitle = element.title.toLowerCase();
        final input = query.toLowerCase();

        return movieTitle.contains(input);
      },
    ).toList();

    setState(() {
      allData.clear();
      allData = suggestion;
    });
  }
}
