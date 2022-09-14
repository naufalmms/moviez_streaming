// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:moviez_streaming/model/box_office_model.dart';
import 'package:moviez_streaming/utils/colors.dart';
import 'package:moviez_streaming/widgets/star_icon_display.dart';

class BoxOfficeCard extends StatelessWidget {
  final BoxOfficeModel boxOfficeModel;
  const BoxOfficeCard({
    Key? key,
    required this.boxOfficeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(
        right: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 207,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                boxOfficeModel.imageUrl,
                // width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    boxOfficeModel.title,
                    style: const TextStyle(
                      color: MyColor.titleTextColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    boxOfficeModel.genre,
                    style: const TextStyle(
                      color: MyColor.subTitleTextColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              StarIconDisplay(value: boxOfficeModel.rating),
            ],
          ),
        ],
      ),
    );
  }
}
