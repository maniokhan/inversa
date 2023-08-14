import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/screens/user_role_screen.dart';
import 'package:inversaapp/src/features/education/presentation/screens/education_screen.dart';
import 'package:inversaapp/src/features/expenses/presentation/screens/other_expenses_screen.dart';
import 'package:inversaapp/src/features/home/presentation/screens/statistics_screen.dart';
import 'package:inversaapp/src/features/store/presentation/screens/inventory_home_screen.dart';
import 'package:inversaapp/src/features/store/presentation/screens/orders_screen.dart';
import 'package:inversaapp/src/features/store/presentation/screens/store_restock_screen.dart';
import 'package:inversaapp/src/features/store/presentation/screens/store_sale_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

final totalSaleProvider = StateProvider<double>((ref) => 0);
final totalRestockProvider = StateProvider<double>((ref) => 0);
final totalExpensesProvider = StateProvider<double>((ref) => 0);

class StoreHomeView extends ConsumerStatefulWidget {
  static Route<StoreHomeView> route() {
    return MaterialPageRoute(builder: (context) => const StoreHomeView());
  }

  const StoreHomeView({super.key});

  @override
  ConsumerState<StoreHomeView> createState() => _StoreHomeViewState();
}

class _StoreHomeViewState extends ConsumerState<StoreHomeView> {
  // double totalRestock = 0;
  // double totalSale = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalSale();
    calculateTotalRestock();
    calculateTotalExpenses();
  }

  Future<void> calculateTotalSale() async {
    double total = 0;

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('orders').get();

    for (var document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      if (data.containsKey('total')) {
        total += data['total'];
      }
    }

    ref.read(totalSaleProvider.notifier).update((state) => total);
  }

  Future<void> calculateTotalRestock() async {
    double total = 0.0;

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    for (var document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      if (data.containsKey('price') && data.containsKey('quantity')) {
        total += ((double.tryParse(data['price']) ?? 0) * data['quantity']);
      }
    }
    ref.read(totalRestockProvider.notifier).update((state) => total);
  }

  Future<void> calculateTotalExpenses() async {
    User? user = FirebaseAuth.instance.currentUser;
    double total = 0;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('expenses')
        .where('user_id', isEqualTo: user!.uid)
        .get();

    for (var document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      if (data.containsKey('price')) {
        total += data['price'];
      }
    }
    ref.read(totalExpensesProvider.notifier).update((state) => total);
  }

  @override
  Widget build(BuildContext context) {
    double totalSale = ref.watch(totalSaleProvider);
    double totalRestock = ref.watch(totalRestockProvider);
    return CommonScaffold(
      appBar: CommonAppBar(
        showleading: true,
        leading: IconButton(
          onPressed: () => Navigator.push(context, UserRoleScreen.route()),
          icon: Assets.images.moreIcon.image(height: 24, width: 24),
        ),
        title: "Home",
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
        children: [
          CommonCard(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Assets.img.path)),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF011627),
                Color(0xFF25AFB5),
              ],
            ),
            onTap: () => Navigator.push(context, EducationScreen.route()),
            customRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.fromLTRB(23, 30, 32, 30),
            // backgroundColor: const Color(0xFF25AFB5),
            showShadow: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText.titleS20(
                  "How it Works",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ConfigColors.white,
                ),
                gapH4,
                const AppText.paragraphI12(
                  "See all educational videos",
                  fontWeight: FontWeight.w500,
                  color: ConfigColors.white,
                ),
                gapH12,
                Image.asset(
                  "assets/images/arrow.png",
                  height: 18,
                ),
              ],
            ),
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  onTap: () => Navigator.push(context, SaleScreen.route()),
                  customRadius: BorderRadius.circular(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  backgroundColor: const Color(0xFF7583FE),
                  showShadow: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.titleS24(
                        "\$${totalSale.toStringAsFixed(0)}",
                        fontWeight: FontWeight.w700,
                        color: ConfigColors.white,
                      ),
                      gapH4,
                      const AppText.paragraphI16(
                        "Total Sale",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ConfigColors.white,
                      ),
                      gapH26,
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CommonCard(
                              showShadow: false,
                              padding: const EdgeInsets.all(8),
                              shape: BoxShape.circle,
                              child: Assets.salePng.image(height: 22),
                            ),
                            gapW64,
                            Assets.outlinedForwardArrow.svg(
                              color: ConfigColors.white,
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: CommonCard(
                  onTap: () =>
                      Navigator.push(context, StoreRestockScreen.route()),
                  customRadius: BorderRadius.circular(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  backgroundColor: const Color(0xFFFF7B9A),
                  showShadow: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.titleS24(
                        // "\$5,284",
                        "\$${totalRestock.toStringAsFixed(0)}",

                        fontWeight: FontWeight.w700,
                        color: ConfigColors.white,
                      ),
                      gapH4,
                      const AppText.paragraphI16(
                        "Total Restock",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ConfigColors.white,
                      ),
                      gapH26,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonCard(
                            showShadow: false,
                            padding: const EdgeInsets.all(8),
                            shape: BoxShape.circle,
                            child: Assets.restock.image(height: 24),
                          ),
                          gapW64,
                          Assets.outlinedForwardArrow.svg(
                            color: ConfigColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH20,
          CommonCard(
            onTap: () => Navigator.push(context, StatisticsScreen.route()),
            customRadius: BorderRadius.circular(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleS24(
                      "\$1,05,284",
                      fontWeight: FontWeight.w700,
                    ),
                    gapH8,
                    AppText.paragraphI14(
                      "Statistics",
                      fontWeight: FontWeight.w500,
                      color: ConfigColors.slateGray,
                    ),
                  ],
                ),
                Assets.statistic.image(height: 66),
              ],
            ),
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  padding: const EdgeInsets.all(16),
                  onTap: () {},
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showBorder: true,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(8),
                            shape: BoxShape.circle,
                            backgroundColor: ConfigColors.backgroundGreen,
                            child: Assets.paymentcard.svg(
                              color: ConfigColors.primary2,
                            ),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH8,
                      const AppText.paragraphI14(
                        "Virtual Cards",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: CommonCard(
                  padding: const EdgeInsets.all(16),
                  onTap: () =>
                      Navigator.push(context, OtherExpensesScreen.route()),
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showBorder: true,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(8),
                            shape: BoxShape.circle,
                            backgroundColor: ConfigColors.backgroundGreen,
                            child: Assets.priceTag.image(
                              height: 20,
                            ),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH8,
                      const AppText.paragraphI14(
                        "Expenses",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: CommonCard(
                  height: 134,
                  width: 163,
                  onTap: () {},
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  backgroundColor: const Color(0xFF3AC3AF),
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showShadow: false,
                            showBorder: true,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(12),
                            shape: BoxShape.circle,
                            child: Assets.scanCodeLightScreen.svg(height: 20),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH20,
                      const AppText.paragraphI16(
                        "Code Scanner",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: CommonCard(
                  height: 134,
                  width: 163,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  onTap: () => Navigator.push(context, OrdersScreen.route()),
                  backgroundColor: ConfigColors.primary,
                  customRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonCard(
                            showBorder: true,
                            showShadow: false,
                            borderColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(10),
                            shape: BoxShape.circle,
                            child: Assets.profile.image(height: 23),
                          ),
                          Assets.outlinedForwardArrow.svg(),
                        ],
                      ),
                      gapH20,
                      const AppText.paragraphI16(
                        "Orders Placed",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH16,
          CommonCard(
            onTap: () => Navigator.push(context, InventoryHomeScreen.route()),
            customRadius: BorderRadius.circular(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.paragraphI16(
                  "Inventory of the \nStore",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                CommonCard(
                  customRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(10),
                  showBorder: true,
                  borderColor: ConfigColors.primary2,
                  backgroundColor: ConfigColors.backgroundGreen,
                  shape: BoxShape.circle,
                  child: Assets.store.svg(
                    height: 28,
                    color: ConfigColors.primary2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
