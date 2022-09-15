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
  TextEditingController editingController = TextEditingController();
  late List<BoxOfficeModel> allData;
  String query = '';

  @override
  void initState() {
    super.initState();

    allData = movieData;
  }

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
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: MyColor.backgroundColor.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 29,
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      buildSearch(editingController.text);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: const TextStyle(
                        color: MyColor.titleTextColor,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: MyColor.titleTextColor,
                      ),
                      hintText: "Search Movie",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: allData.isNotEmpty &&
                              editingController.text.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(bottom: 23),
                              child: Text(
                                "Search Result (${allData.length})",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: MyColor.titleTextColor,
                                ),
                              ),
                            )
                          : editingController.text.isNotEmpty
                              ? Container(
                                  margin: const EdgeInsets.only(bottom: 23),
                                  child: const Text(
                                    "Search Result (0)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: MyColor.titleTextColor,
                                    ),
                                  ),
                                )
                              : null),
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
          ],
        ),
      ),
    );
  }

  void buildSearch(String query) {
    final movies = movieData.where(
      (element) {
        final movieTitle = element.title.toLowerCase();
        final input = query.toLowerCase();
        return movieTitle.contains(input);
      },
    ).toList();

    setState(() {
      this.query = query;
      allData = movies;
    });
  }
}
