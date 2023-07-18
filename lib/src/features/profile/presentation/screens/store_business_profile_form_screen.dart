// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/profile/presentation/provider/user_account_notifier_provider.dart';
import 'package:inversaapp/src/features/profile/presentation/provider/user_account_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

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
  late final TextEditingController _storeName;
  late final TextEditingController _address;
  late final TextEditingController _email;

  @override
  void initState() {
    _storeName = TextEditingController();
    _address = TextEditingController();
    _email = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userAccount = ref.watch(userAccountProvider);
    return Scaffold(
      body: CommonScaffold(
        appBar: CommonAppBar(
          showleading: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ConfigColors.white,
            ),
          ),
          title: "Business Profile",
        ),
        body: userAccount.when(
          data: (data) {
            _storeName.text = data['store_name'].toString();
            _address.text = data['address'].toString();
            _email.text = data['email'].toString();
            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              children: [
                CommonTextFieldTitle(
                  leading: Assets.store.svg(color: ConfigColors.primary2),
                  text: 'Name of Store',
                ),
                gapH8,
                CommonTextField(
                  controller: _storeName,
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
                  controller: _address,
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
                  controller: _email,
                  hintText: "info@gmail.com",
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 241),
                CommonButton(
                  text: "Save",
                  onPress: () async {
                    await ref
                        .read(userAccountNotifierProvider.notifier)
                        .updateUserAccount(
                      documentId: data["documentId"],
                      data: {
                        'store_name': _storeName.text,
                        'address': _address.text,
                      },
                    );
                    await Future.delayed(const Duration(microseconds: 200),
                        () => Navigator.pop(context));
                  },
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return const Icon(Icons.error);
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
