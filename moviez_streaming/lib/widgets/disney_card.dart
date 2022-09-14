// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:moviez_streaming/utils/colors.dart';
import 'package:moviez_streaming/widgets/star_icon_display.dart';

import '../model/box_office_model.dart';

class DisneyCard extends StatelessWidget {
  final BoxOfficeModel boxOfficeModel;
  const DisneyCard({
    Key? key,
    required this.boxOfficeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          SizedBox(
            height: 127,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                boxOfficeModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                boxOfficeModel.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: MyColor.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                boxOfficeModel.genre,
                style: const TextStyle(
                  fontSize: 16,
                  color: MyColor.subTitleTextColor,
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              StarIconDisplay(value: boxOfficeModel.rating),
            ],
          )
        ],
      ),
    );
  }
}
