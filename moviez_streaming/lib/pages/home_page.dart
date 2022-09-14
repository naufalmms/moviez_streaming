import 'package:flutter/material.dart';
import 'package:moviez_streaming/pages/search_page.dart';
import 'package:moviez_streaming/utils/colors.dart';
import 'package:moviez_streaming/widgets/box_office_card.dart';
import 'package:moviez_streaming/widgets/disney_card.dart';
import '../sample_data/box_office_data.dart';
import '../sample_data/disney_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 29,
          left: 24,
          right: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 61,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Moviez",
                          style: TextStyle(
                            fontSize: 28,
                            color: MyColor.titleTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Watch much easier",
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColor.subTitleTextColor,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ));
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              // BoxOfficeCard(),
              SizedBox(
                height: 276,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return BoxOfficeCard(boxOfficeModel: movieData[index]);
                  },
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              const Text(
                "From Disney",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColor.titleTextColor,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ...disneyData.map(
                (disneyData) => DisneyCard(boxOfficeModel: disneyData),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
