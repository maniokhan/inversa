// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/screens/user_role_screen.dart';
import 'package:inversaapp/src/features/store/presentation/screens/order_placement_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

final StateProvider<LatLng> currentLatLng = StateProvider<LatLng>(
  (StateProviderRef<Object?> ref) => const LatLng(25.4292516, 68.3461768),
);

class ClientHomeView extends ConsumerStatefulWidget {
  final int currentPageIndex;
  final Function(int) seeAllStore;
  const ClientHomeView({
    super.key,
    required this.currentPageIndex,
    required this.seeAllStore,
  });

  @override
  ConsumerState<ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends ConsumerState<ClientHomeView> {
  late GoogleMapController googleMapController;
  LatLng currentPosition = const LatLng(25.4292516, 68.3461768);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    //   tabController = TabController(length: 4, vsync: this);
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // ref.read(locationPermission.notifier).update((state) => false);
      final LocationPermission check = await Geolocator.requestPermission();
      if (check == LocationPermission.always) {
        //   ref.read(locationPermission.notifier).update((state) => true);
        final Position currentPosition = await Geolocator.getCurrentPosition();
        final LatLng currentLocation = ref.read(currentLatLng.notifier).update(
              (state) =>
                  LatLng(currentPosition.latitude, currentPosition.longitude),
            );
        await fetchDataWithin1KM(currentLocation);
        await googleMapController
            .animateCamera(CameraUpdate.newLatLng(currentLocation));
      }
    } else {
      // ref.read(locationPermission.notifier).update((state) => true);
      final Position currentPosition = await Geolocator.getCurrentPosition();
      final LatLng currentLocation = ref.read(currentLatLng.notifier).update(
            (state) =>
                LatLng(currentPosition.latitude, currentPosition.longitude),
          );
      await fetchDataWithin1KM(currentLocation);
      await googleMapController
          .animateCamera(CameraUpdate.newLatLng(currentLocation));
    }
  }

  Future<void> fetchDataWithin1KM(LatLng currentLocation) async {
    List<Map<String, dynamic>> dataList = [];
    // Create a GeoPoint object for the current location
    final GeoPoint userLocation =
        GeoPoint(currentLocation.latitude, currentLocation.longitude);

    final CollectionReference userAccountsRef =
        FirebaseFirestore.instance.collection('user_accounts');

    // Use a GeoPoint to define a bounding box around the user's location
    final double lat = userLocation.latitude;
    final double lon = userLocation.longitude;

    // The following calculations are approximate and based on latitude.
    // For more precise calculations, consider using a library like "geodesy".
    const double latRange = 0.009; // Approximately 1 km in latitude
    const double lonRange = 0.014; // Approximately 1 km in longitude

    final double lowerLat = lat - latRange;
    final double upperLat = lat + latRange;
    final double lowerLon = lon - lonRange;
    final double upperLon = lon + lonRange;

    // Query Firestore for documents within the bounding box

    try {
      final QuerySnapshot querySnapshot = await userAccountsRef
          .where('role', isEqualTo: 'store')
          .where(
            'store_location',
            isGreaterThanOrEqualTo: GeoPoint(lowerLat, lowerLon),
          )
          .where(
            'store_location',
            isLessThanOrEqualTo: GeoPoint(upperLat, upperLon),
          )
          .get();
      log('Abubakar length: ${querySnapshot.docs.length}');
      Set<Marker> newMarkers = Set.from(
        querySnapshot.docs.map((doc) {
          final data = doc.data()! as Map<String, dynamic>;
          dataList.add(doc.data() as Map<String, dynamic>);
          final storeLocation = data['store_location'] as GeoPoint;

          // Create a marker for each document
          return Marker(
            markerId: MarkerId(
              doc.id,
            ),
            position: LatLng(storeLocation.latitude, storeLocation.longitude),
            infoWindow: InfoWindow(
              title: data['name'] as String,
              snippet: data['address'] as String,
              onTap: () {
                Navigator.push(
                    context, OrderPlacementScreen.route(data["user_id"]));
              },
            ),
          );
        }),
      );
      // ref.read(providersData.notifier).update(
      //       (state) => dataList,
      //     );
      setState(() {
        _markers = newMarkers;
      });
    } on FirebaseException catch (e) {
      print(
        '////////////////////////// ${e.message} ///////////////////////////////////',
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    googleMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        showleading: true,
        leading: IconButton(
          // onPressed: () {
          //   ref
          //       .read(authenticationProvider.notifier)
          //       .changeState(AuthState.selectRole);
          // },
          onPressed: () => Navigator.push(
            context,
            UserRoleScreen.route(),
          ),
          icon: Assets.images.moreIcon.image(height: 24, width: 24),
        ),
        title: "Client",
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              // Expanded(
              //   child: CommonCard(
              //     height: 123,
              //     width: 163,
              //     padding: const EdgeInsets.all(16),
              //     onTap: () {
              //       Navigator.push(context, AllStoresScreen.route());
              //     },
              //     backgroundColor: const Color(0xFF14BEF0),
              //     customRadius: BorderRadius.circular(20),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         CommonCard(
              //           showShadow: false,
              //           padding: const EdgeInsets.all(6),
              //           shape: BoxShape.circle,
              //           child: Assets.coupon.image(height: 20),
              //         ),
              //         const AppText.paragraphI16(
              //           "Coupons",
              //           fontWeight: FontWeight.w600,
              //           color: ConfigColors.white,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // gapW16,
              Expanded(
                child: CommonCard(
                  height: 100,
                  // width: 163,
                  padding: const EdgeInsets.all(16),
                  onTap: () {
                    widget.seeAllStore(1);
                  },
                  backgroundColor: const Color(0xFF3AC3AF),
                  customRadius: BorderRadius.circular(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      gapW12,
                      CommonCard(
                        height: 51,
                        width: 51,
                        showShadow: false,
                        padding: const EdgeInsets.all(10),
                        shape: BoxShape.circle,
                        child: Assets.orderPlace.image(
                          height: 20,
                        ),
                      ),
                      // CommonCard(
                      //   showShadow: false,
                      //   padding: const EdgeInsets.all(6),
                      //   shape: BoxShape.circle,
                      //   child: Assets.orderPlace.image(height: 20),
                      // ),
                      gapW20,
                      const AppText.titleS20(
                        "Order Placement",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.white,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH16,
          CommonCard(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF3CC0B8),
                Color(0xFF12A69D),
              ],
            ),
            height: 100,
            width: 343,
            padding: const EdgeInsets.all(24),
            onTap: () => showBottomSheet(context),
            customRadius: BorderRadius.circular(18),
            backgroundColor: const Color(0xFF3CC0B8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppText.titleS20(
                      "Virtual Card",
                      fontWeight: FontWeight.w700,
                    ),
                    AppText.paragraphI14(
                      "230 cards",
                      fontWeight: FontWeight.w500,
                      color: ConfigColors.slateGray,
                    ),
                  ],
                ),
                CommonCard(
                  height: 68,
                  width: 68,
                  showShadow: false,
                  padding: const EdgeInsets.all(10),
                  shape: BoxShape.circle,
                  child: Assets.paymentcard.svg(
                    // height: 28,
                    color: ConfigColors.primary2,
                  ),
                ),
              ],
            ),
          ),
          gapH20,
          const AppText.paragraphI16(
            "Near By Store",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          gapH16,
          CommonCard(
            height: 240,
            customRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.all(10),
            //  onTap: () {},
            child: GoogleMap(
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 13.8,
              ),
              onMapCreated: (controller) {
                setState(() {
                  googleMapController = controller;
                });
              },
              markers: _markers,
              circles: {
                Circle(
                  circleId: const CircleId('1'),
                  center: currentPosition,
                  radius: 1000,
                  strokeWidth: 1,
                  fillColor: const Color(0xFF006491).withOpacity(0.2),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }

  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonCard(
                height: 4,
                width: 75,
                backgroundColor: const Color(0xFFC4C4C4),
                customRadius: BorderRadius.circular(5),
                child: const Text(""),
              ),
              gapH20,
              CommonCard(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF3CC0B8),
                    Color(0xFF011627),
                  ],
                ),
                height: 190,
                width: 343,
                backgroundColor: ConfigColors.primary2,
                showShadow: false,
                customRadius: BorderRadius.circular(6),
                padding: const EdgeInsets.only(
                    left: 3, right: 3, top: 2, bottom: 15),
                child: Column(
                  children: [
                    CommonCard(
                      showShadow: false,
                      padding: const EdgeInsets.all(0),
                      customRadius: BorderRadius.circular(6),
                      height: 31,
                      width: 337,
                      alignment: Alignment.center,
                      child: const AppText.paragraphI16(
                        "Virtual Card",
                        fontWeight: FontWeight.w500,
                        color: ConfigColors.primary2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Assets.appLogoGreenSvg.svg(width: 160),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText.paragraphI14(
                                "Amount Points",
                                fontWeight: FontWeight.w500,
                                color: ConfigColors.white,
                              ),
                              AppText.paragraphI16(
                                "300",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: ConfigColors.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Assets.barCode.image(width: 213, height: 65),
                  ],
                ),
              ),
              gapH32,
            ],
          ),
        );
      },
    );
  }
}
