import 'package:flutter/material.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/inventory/tabs/new_list_tab_view.dart';
import 'package:inversaapp/src/features/store/inventory/tabs/old_list_tab_view.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CompareScreen extends StatefulWidget {
  static Route<CompareScreen> route() {
    return MaterialPageRoute(builder: (context) => const CompareScreen());
  }

  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ConfigColors.white,
          ),
        ),
        centerTitle: true,
        title: const AppText.titleS20(
          "Compare",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
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
                  text: 'Old List',
                ),
                Tab(
                  text: 'New List',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                OldListTabView(),
                NewListTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
