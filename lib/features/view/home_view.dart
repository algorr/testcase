import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:testcase/features/resources/index.dart';
import 'package:testcase/features/viewmodel/controller/controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<Controller>();
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appBarTitle),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {},
                decoration:
                    const InputDecoration(hintText: AppStrings.textEditingHint),
              ),
            ),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: size.height,
                      width: size.width,
                      child: ListView.builder(
                        itemCount: controller.albums.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: AppSize.s10,
                            child: ListTile(
                              leading: Image.network(
                                  controller.albums[index].thumbnailUrl!),
                              title: Text(controller.albums[index].title!),
                              subtitle:
                                  Text(controller.albums[index].id.toString()),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ));
  }
}
