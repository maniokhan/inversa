// import 'package:flutter/material.dart';
// import 'package:inversaapp/src/assets/assets.gen.dart';
// import 'package:inversaapp/src/common_widgets/common_button.dart';
// import 'package:inversaapp/src/common_widgets/common_text_field.dart';
// import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
// import 'package:inversaapp/src/constants/app_sizes.dart';
// import 'package:inversaapp/src/theme/config_colors.dart';
// import 'package:inversaapp/src/theme/text.dart';

// class ClientBusinessProfileFormScreen extends StatelessWidget {
//   static route() {
//     return MaterialPageRoute(
//         builder: (context) => const ClientBusinessProfileFormScreen());
//   }

//   const ClientBusinessProfileFormScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF2AB0B6),
//         elevation: 0,
//         leading: const Icon(
//           Icons.arrow_back_ios_new_outlined,
//           color: ConfigColors.white,
//         ),
//         centerTitle: true,
//         title: const AppText.titleS20(
//           "Business Profile",
//           color: ConfigColors.white,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
//         children: [
//           // TODO:  Client icon not shown
//           CommonTextFieldTitle(
//             leading: Assets.store.svg(color: ConfigColors.primary2),
//             text: 'Name',
//           ),
//           gapH8,
//           const CommonTextField(
//             hintText: "Enter your name",
//             textInputType: TextInputType.name,
//           ),
//           gapH24,
//           CommonTextFieldTitle(
//             leading: Assets.address.svg(),
//             text: 'Address',
//           ),
//           gapH8,
//           const CommonTextField(
//             hintText: "Add Address",
//             textInputType: TextInputType.streetAddress,
//           ),
//           gapH24,
//           CommonTextFieldTitle(
//             leading: Assets.emailGreen.svg(),
//             text: 'Email',
//           ),
//           gapH8,
//           const CommonTextField(
//             hintText: "info@gmail.com",
//             textInputType: TextInputType.emailAddress,
//           ),
//           const SizedBox(height: 241),
//           CommonButton(text: "Save", onPress: () {}),
//         ],
//       ),
//     );
//   }
// }

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

class ClientBusinessProfileFormScreen extends ConsumerStatefulWidget {
  static Route<ClientBusinessProfileFormScreen> route() {
    return MaterialPageRoute(
        builder: (context) => const ClientBusinessProfileFormScreen());
  }

  const ClientBusinessProfileFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClientBusinessProfileFormScreenState();
}

class _ClientBusinessProfileFormScreenState
    extends ConsumerState<ClientBusinessProfileFormScreen> {
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
    final userAccount = ref.watch(userAccountProvider.select((value) => value));

    ref.listen(userAccountNotifierProvider, (previous, next) {
      if (!next) {
        Navigator.pop(context);
      }
    });
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
        title: "Business Profile",
      ),
      body: userAccount.when(
        data: (data) {
          _storeName.text = data['name'].toString();
          _address.text = data['address'].toString();
          _email.text = data['email'].toString();
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            children: [
              CommonTextFieldTitle(
                leading: Assets.store.svg(color: ConfigColors.primary2),
                text: 'Name',
              ),
              gapH8,
              CommonTextField(
                controller: _storeName,
                hintText: "Enter your name",
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
                      'email:': _email.text,
                      'name': _storeName.text,
                      'address': _address.text,
                    },
                  );
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
    );
  }
}
