// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonOrderPlacementCard extends StatelessWidget {
  final String image;
  final String title, subtitle;
  final String price;
  const CommonOrderPlacementCard(
      {Key? key,
      required this.image,
      required this.subtitle,
      required this.price,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.all(0),
      customRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.3,
                    color: ConfigColors.blueGrey,
                  ),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => Container(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.paragraphI14(
                    title,
                    fontWeight: FontWeight.w600,
                  ),
                  gapH4,
                  AppText.paragraphI14(
                    subtitle,
                    fontWeight: FontWeight.w400,
                  ),
                  gapH12,
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.paragraphI16(
                          "\$$price",
                          fontWeight: FontWeight.w600,
                        ),
                        CommonCard(
                          onTap: () {},
                          customRadius: BorderRadius.circular(6),
                          backgroundColor: ConfigColors.primary2,
                          padding: const EdgeInsets.all(6),
                          showShadow: false,
                          child: Assets.basketWhite.svg(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, top: 4),
            height: 18,
            width: 106,
            decoration: const BoxDecoration(
                color: ConfigColors.black500,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
            child: const AppText.paragraphI9(
              "Exp Date: 05/06/2023",
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: ConfigColors.crema100Background,
            ),
          ),
        ],
      ),
    );
  }
}
