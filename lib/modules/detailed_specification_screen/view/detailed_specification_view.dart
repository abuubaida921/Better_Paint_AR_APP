import 'dart:convert';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/modules/detailed_specification_screen/controller/detailed_specification_controller.dart';
import 'package:better_painting/modules/room_selection_screen/view/room_selection_view.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailedSpecificationView
    extends GetView<DetailedSpecificationController> {
  const DetailedSpecificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height:MediaQuery.of(context).size.height ,
        child: Stack(
          children: [
            _buildBackground(),
            Image.asset(
              'assets/images/top_left.png',
              width: 120,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bottom_right.png',
                width: 120,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Specify Areas to be Painted',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(backgroundColor)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                  
                    // ---------------- Speficify Areas Painted Section ---------------- //
                    Obx(
                      () => controller.isLoading
                          ? const Center(
                              child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Color(primaryColor),
                                )),
                              ),
                            )
                          : Center(
                              child: SizedBox(
                                  //color: Colors.amber,
                                  //width: double.maxFinite,
                                  height: MediaQuery.of(context).size.height * .3,
                                  child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                    children: List.generate(
                                        controller.specificationOptions.length,
                                        (index) {
                                      var items = controller
                                          .specificationOptions[index];
                                      return Obx(
                                        () => _buildDetailOption(
                                          items.speacificationName!,
                                          specificationid:
                                              items.specificationId,
                                          isSelected: controller.selectedAreas
                                              .contains(items.specificationId),
                                          onTap: () {
                                            controller.toggleArea(
                                                specificationId:
                                                    items.specificationId);
                                          },
                                        ),
                                      );
                                    }),
                                  )
                  
                                  // ListView.separated(
                                  //     shrinkWrap: true,
                                  //     physics: const BouncingScrollPhysics(),
                                  //     itemBuilder: (context, index) {
                  
                                  //       // return Obx(
                                  //       //   () => _buildDetailOption(
                                  //       //     items.speacificationName!,
                                  //       //     specificationid:
                                  //       //         items.specificationId,
                                  //       //     isSelected: controller.selectedAreas
                                  //       //         .contains(items.specificationId),
                                  //       //     onTap: () {
                                  //       //       controller.toggleArea(
                                  //       //           specificationId:
                                  //       //               items.specificationId);
                                  //       //     },
                                  //       //   ),
                                  //       // );
                                  //     },
                                  //     separatorBuilder: (context, index) {
                                  //       return const SizedBox(
                                  //         height: 0,
                                  //       );
                                  //     },
                                  //     itemCount:
                                  //         controller.specificationOptions.length),
                                  ),
                            ),
                    ),
                  
                  
                  
                    // ---------------- Add Ons List Section ---------------- //
                    Obx(
                      () {
                        return controller.addonsAreas.isEmpty
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  Text(
                                    'Add ons',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                  //color: Colors.amber,
                                  height: MediaQuery.of(context).size.height * .3,
                                    child: ListView(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    children: List.generate(
                                         controller.addOnsOption.length,
                                        (index) {
                                      var items = controller
                                          .addOnsOption[index];
                                      return Obx(
                                         // Assign Checker if the addOnsOption id contain in addOnsArea //
                                          () => controller.addonsAreas
                                                  .contains(controller
                                                      .addOnsOption[index]
                                                     .specificationId)
                                             ? _buildDetailOption(
                                                 items.speacificationName!,
                                                  specificationid:
                                                      items.specificationId,
                                                  isSelected: controller
                                                      .addonsAreas
                                                       .contains(items
                                                          .specificationId),
                                                   onTap: () {
                                                     controller.toggleAddOnsArea(
                                                         specificationId: items
                                                            .specificationId);
                                                   },
                                               )
                                              : const SizedBox(),
                                          );
                                    }),
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                    
                    SizedBox(
                      height: 15.h,
                    ),
                  
                    // ---------------- Add ons Button ---------------- //
                    Card(
                      color: const Color(primaryColor),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: const Text(
                          'Add Ons',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        trailing: const CircleAvatar(
                            backgroundColor: btnColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                        onTap: () {
                          controller.getAddOnsList();
                          showOptionsModal(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ---------------- Add New Button ---------------- //
                        Expanded(
                          child: SizedBox(
                            width: 150.w,
                            child: ElevatedButton(
                              onPressed: () {
                                GlobalController gController =
                                    Get.find<GlobalController>();
                  
                                gController.addUserData(
                                    gController.roomSrviceId.value,
                                    gController.roomServiceName.value,
                                    gController.roomName.value,
                                    controller.selectedAreas,
                                    controller.addonsAreas);
                                Get.offUntil(
                                  GetPageRoute(
                                    routeName: RoutesNames.roomSelectionScreen,
                                    page: () => const RoomSelectionView(),
                                  ),
                                  (route) => route.isFirst,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Add New',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // ---------------- Next Button ---------------- //
                        Expanded(
                          child: SizedBox(
                            width: 150.w,
                            child: ElevatedButton(
                              onPressed: () {
                                GlobalController gController =
                                    Get.find<GlobalController>();
                  
                                gController.addUserData(
                                    gController.roomSrviceId.value,
                                    gController.roomServiceName.value,
                                    gController.roomName.value,
                                    controller.selectedAreas,
                                    controller.addonsAreas);
                  
                                print(jsonEncode(
                                    Get.find<GlobalController>().dataList));
                  
                                Get.toNamed(RoutesNames.invoiceScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: btnColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
    );
  }

  // ---------------- Custome List Tile Widget ---------------- //
  Widget _buildDetailOption(String title,
      {String? specificationid, void Function()? onTap, bool? isSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: .0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: isSelected! ? Colors.blue[50] : Colors.white,
            child: ListTile(
              leading: Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? Colors.blueAccent : Colors.grey,
              ),
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- Bottm Model Sheet Design Section ---------------- //
void showOptionsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return OptionsModal();
    },
  );
}

class OptionsModal extends GetView<DetailedSpecificationController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 400,
      child: Column(
        children: [
          const Text(
            'Add-on',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Obx(
            () => controller.isAddOnsLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 320,
                    child: ListView.builder(
                      itemCount: controller.addOnsOption.length,
                      itemBuilder: (context, index) {
                        var item = controller.addOnsOption[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.add_circle,
                              color: Color(primaryColor),
                            ),
                            title: Text(
                              item.speacificationName!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              controller.addonsAreas.add(item.specificationId!);
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
