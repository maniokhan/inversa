import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class StoreBusinessProfileFormScreen extends ConsumerStatefulWidget {
  static Route<StoreBusinessProfileFormScreen> route() {
    return MaterialPageRoute(
        builder: (context) => const StoreBusinessProfileFormScreen());
  }

  const StoreBusinessProfileFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StoreBusinessProfileFormScreenState();
}

class _StoreBusinessProfileFormScreenState
    extends ConsumerState<StoreBusinessProfileFormScreen> {
  late final TextEditingController _storeNameController;
  late final TextEditingController _addressController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    _storeNameController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();

    super.initState();
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
          "Business Profile",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          CommonTextFieldTitle(
            leading: Assets.store.svg(color: ConfigColors.primary2),
            text: 'Name of Store',
          ),
          gapH8,
          CommonTextField(
            controller: _storeNameController,
            hintText: "Add Store",
            textInputType: TextInputType.name,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.address.svg(),
            text: 'Address',
          ),
          gapH8,
          CommonTextField(
            controller: _addressController,
            hintText: "Add Address",
            textInputType: TextInputType.streetAddress,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.emailGreen.svg(),
            text: 'Email',
          ),
          gapH8,
          CommonTextField(
            controller: _emailController,
            hintText: "info@gmail.com",
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 241),
          CommonButton(text: "Save", onPress: () {}),
        ],
      ),
    );
  }
}
