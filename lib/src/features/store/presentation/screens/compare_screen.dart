import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/widgets/new_list_tab_view.dart';
import 'package:inversaapp/src/features/store/presentation/widgets/old_list_tab_view.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

final oldListProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);

class CompareScreen extends ConsumerStatefulWidget {
  static Route<CompareScreen> route(List<Map<String, dynamic>> products) {
    return MaterialPageRoute(
        builder: (context) => CompareScreen(
              products: products,
            ));
  }

  const CompareScreen({super.key, required this.products});
  final List<Map<String, dynamic>> products;

  @override
  ConsumerState<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends ConsumerState<CompareScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  Future<void> fetchProducts(WidgetRef ref) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('store_stock')
          .where('user_id', isEqualTo: currentUser.uid)
          .get();

      List<Map<String, dynamic>> fetchedProducts = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return data;
      }).toList();

      ref.read(oldListProvider.notifier).update((state) => fetchedProducts);
    } on FirebaseException catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchProducts(ref);
    });
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isScaffold: true,
      appBar: CommonAppBar(
        showleading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ConfigColors.white,
          ),
        ),
        title: "Compare",
      ),
      body: Column(
        children: [
          gapH24,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 34,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(42, 176, 182, 0.18),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TabBar(
              controller: tabController,
              unselectedLabelColor: ConfigColors.primary2,
              labelColor: Colors.white,
              indicatorWeight: 2,
              indicator: BoxDecoration(
                color: ConfigColors.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              tabs: const [
                Tab(
                  text: 'New List',
                ),
                Tab(
                  text: 'Old List',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                NewListTabView(
                  products: widget.products,
                ),
                const OldListTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


  // List<Map<String, dynamic>> newList = [];
  // List<Map<String, dynamic>> oldList = [];
  // bool loading = false;

  // Future<void> fetchProducts() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     QuerySnapshot<Map<String, dynamic>> snapshot =
  //         await FirebaseFirestore.instance.collection('products').get();

  //     DateTime currentTime = DateTime.now();
  //     DateTime twentyFourHoursAgo =
  //         currentTime.subtract(const Duration(hours: 24));

  //     List<Map<String, dynamic>> fetchedProducts = snapshot.docs.map((doc) {
  //       Map<String, dynamic> data = doc.data();
  //       data['timestamp'] = (data['timestamp'] as Timestamp).toDate();
  //       return data;
  //     }).toList();

  //     setState(() {
  //       newList = fetchedProducts
  //           .where(
  //               (product) => product['timestamp'].isAfter(twentyFourHoursAgo))
  //           .toList();
  //       oldList = fetchedProducts
  //           .where(
  //               (product) => product['timestamp'].isBefore(twentyFourHoursAgo))
  //           .toList();

  //       loading = false;
  //     });
  //   } on FirebaseException catch (e) {
  //     print("Error fetching data: $e");
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }
