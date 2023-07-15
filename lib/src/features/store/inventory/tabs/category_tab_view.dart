// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/features/store/inventory/bakery_screen.dart';
import 'package:inversaapp/src/features/store/inventory/dairy_and_egg_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 4 / 3.4,
      children: [
        CommonCategoryCard(
          onTap: () {
            Navigator.push(context, BakeryScreen.route());
          },
          image: Assets.bakery.image(color: ConfigColors.white),
          title: 'Bakery',
          cardBackgroundColor: const Color(0xFFF6A69B),
        ),
        CommonCategoryCard(
          onTap: () {},
          image: Assets.frozenFood.image(),
          title: 'Frozen Food',
          cardBackgroundColor: const Color(0xFFFF7B9A),
        ),
        CommonCategoryCard(
          onTap: () {},
          image: Assets.beverage.image(),
          title: 'Beverages',
          cardBackgroundColor: const Color(0xFF22BECF),
        ),
        CommonCategoryCard(
          onTap: () {
            Navigator.push(context, DairyEggScreen.route());
          },
          image: Assets.dairyAndEgg.image(),
          title: 'Dairy & Eggs',
          cardBackgroundColor: const Color(0xFFC379FF),
        ),
        CommonCategoryCard(
          onTap: () {},
          image: Assets.personalCare.image(),
          title: 'Personal Care',
          cardBackgroundColor: const Color(0xFFFF8744),
        ),
        CommonCategoryCard(
          onTap: () {},
          image: Assets.freshProduct.image(),
          title: 'Fresh Product',
          cardBackgroundColor: const Color(0xFFFFCB45),
        ),
        CommonCategoryCard(
          onTap: () {},
          image: Assets.pantryStaples.image(),
          title: 'Pantry Staples',
          cardBackgroundColor: const Color(0xFF7583FE),
        ),
        CommonCategoryCard(
          onTap: () {},
          image: Assets.meatSeafood.image(),
          title: 'Meat & Seafood',
          cardBackgroundColor: const Color(0xFF76FFC6),
        ),
      ],
    );
  }
}

class CommonCategoryCard extends StatelessWidget {
  final String title;
  final Widget image;
  final Color cardBackgroundColor;
  final VoidCallback onTap;
  const CommonCategoryCard({
    Key? key,
    required this.title,
    required this.image,
    required this.cardBackgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      height: 136,
      width: 164,
      onTap: onTap,
      customRadius: BorderRadius.circular(18),
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CommonCard(
            height: 52,
            width: 52,
            showShadow: false,
            padding: const EdgeInsets.all(12),
            backgroundColor: cardBackgroundColor,
            shape: BoxShape.circle,
            child: image,
          ),
          AppText.paragraphS16(
            title,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: ConfigColors.black,
          ),
        ],
      ),
    );
  }
}
