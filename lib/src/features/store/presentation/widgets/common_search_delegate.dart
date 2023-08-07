// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonSearchDelegate extends SearchDelegate {
  final Function(List<Map<String, dynamic>>) onChanged;
  final List<Map<String, dynamic>> searchTerms;
  CommonSearchDelegate({
    required this.onChanged,
    required this.searchTerms,
  });
// Demo list to show querying

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result['name']),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      padding: const EdgeInsets.only(top: 1, bottom: 36),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var item = matchQuery[index];

        // return ListTile(
        //   title: Text(result['name']),
        // );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: GestureDetector(
            onTap: () {
              close(context, item);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonCard(
                  height: 91,
                  width: 343,
                  padding: const EdgeInsets.all(10),
                  customRadius: BorderRadius.circular(16),
                  child: Row(
                    children: [
                      CommonCard(
                        height: 71,
                        width: 76,
                        padding: const EdgeInsets.all(10),
                        backgroundColor: const Color(0xFFf2f2f2),
                        child: CachedNetworkImage(
                          imageUrl: item['image'],
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      gapW16,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.paragraphS16(
                              item['name'],
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            gapH4,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText.paragraphS16(
                                  "\$${item['price']}",
                                  fontWeight: FontWeight.w600,
                                  color: ConfigColors.primary2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
