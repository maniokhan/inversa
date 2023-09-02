import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CommonOrderPlacementCard extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> product;
  const CommonOrderPlacementCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommonOrderPlacementCardState();
}

class _CommonOrderPlacementCardState extends State<CommonOrderPlacementCard> {
  // late final Map<String, dynamic> product;
  // @override
  // void initState() {
  //   product = widget.product;
  //   super.initState();
  // }

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
                imageUrl: widget.product['image'],
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
                    widget.product['name'],
                    fontWeight: FontWeight.w600,
                    textDecoration: widget.product['isShoppingCart']
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                  gapH4,
                  AppText.paragraphI14(
                    '${widget.product['units']['value']} ${widget.product['units']['name']} ',
                    fontWeight: FontWeight.w400,
                    textDecoration: widget.product['isShoppingCart']
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                  gapH12,
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.paragraphI16(
                          widget.product['price'],
                          fontWeight: FontWeight.w600,
                          textDecoration: widget.product['isShoppingCart']
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                        // CommonCard(
                        //   onTap: () async {
                        //     if (widget.product['isShoppingCart']) {
                        //       await ref
                        //           .read(
                        //               shoppingCartNotifierProvider.notifier)
                        //           .deleteProductShoppingCart(
                        //               widget.product['shopping_cart_id']);
                        //     } else {
                        //       await ref
                        //           .read(
                        //               shoppingCartNotifierProvider.notifier)
                        //           .createShoppingCart(
                        //         data: {
                        //           'quantity': 01,
                        //           'image': product["image"],
                        //           'title': product['name'],
                        //           'price': product['price'],
                        //           'total_price_quantity': product['price']
                        //               .toString()
                        //               .tryParseToInt(),
                        //           'product_id': product['documentId'],
                        //         },
                        //       );
                        //     }
                        //   },
                        //   customRadius: BorderRadius.circular(6),
                        //   backgroundColor: ConfigColors.primary2,
                        //   padding: const EdgeInsets.all(6),
                        //   showShadow: false,
                        //   child: !product['isShoppingCart']
                        //       ? Assets.basketWhite.svg(height: 16)
                        //       : const Icon(
                        //           Icons.delete,
                        //           color: ConfigColors.white,
                        //           size: 16,
                        //         ),
                        // ),
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
            child: AppText.paragraphI9(
              "Exp Date: ${widget.product['expDate']}",
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
