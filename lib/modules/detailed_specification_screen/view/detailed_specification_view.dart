import 'package:better_painting/main.dart';
import 'package:better_painting/modules/detailed_specification_screen/controller/detailed_specification_controller.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedSpecificationView
    extends GetView<DetailedSpecificationController> {
  const DetailedSpecificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
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

                  // List of Details Otions //
                  // List of Detail Options (Walls, Doors, etc.)
                  // Obx(
                  //   () => Column(
                  //     children: controller.detailOptions.map((option) {
                  //       return _buildDetailOption(option);
                  //     }).toList(),
                  //   ),
                  // ),

                  Obx(
                    () => controller.isLoading
                        ? const Center(
                          child:  SizedBox(
                              width: 200,
                              height: 200,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Color(primaryColor),
                              )),
                            ),
                        )
                        : Center(
                            child: Container(
                              // color: Colors.amber,
                              width: 400,
                              height: 380,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var items = controller.detailOptions[index];
                                    return _buildDetailOption(
                                      items,
                                      onTap: () {
                                        controller.toggleArea(items);
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 0,
                                    );
                                  },
                                  itemCount: controller.detailOptions.length),
                            ),
                          ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  // Add ons Card Section //
                  Card(
                    color: const Color(primaryColor),
                    elevation: 4,
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

                  // Button to proceed (navigate to AR Measurement screen)
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () {
                           Get.offNamed(RoutesNames.serviceSelectionScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: btnColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                            
                              Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                               SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add New',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                             
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20,),  
                        
                      SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: btnColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
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
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
    );
  }

  // Widget for Detail Option (Toggles between selected/deselected)
  Widget _buildDetailOption(String title, {void Function()? onTap}) {
    return Obx(() {
      bool isSelected = controller.selectedAreas.contains(title);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          color: isSelected ? Colors.blue[50] : Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
      );
    });
  }
}

// Function For Trigger Model Sheet //
void showOptionsModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return OptionsModal();
    },
  );
}

// Model Sheet Ui //
class OptionsModal extends GetView<DetailedSpecificationController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 400,
      child: Column(
        children: [
          const Text('Add-on', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
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
                   Icons.add_circle, color: Color(primaryColor),
                  ),
                  title: Text(
                    item,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    controller.detailOptions.add(item);
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
