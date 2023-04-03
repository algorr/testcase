import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:testcase/core/widgets/custom_circular_progress_bar.dart';
import 'package:testcase/features/resources/index.dart';
import 'package:testcase/features/router/app_router.dart';
import 'package:testcase/features/viewmodel/controller/controller.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<Controller>();

    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appBarTitle),
        ),
        body: _homeListView(controller, size));
  }

//* Listview func for body
  ListView _homeListView(Controller controller, Size size) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: TextField(
            onChanged: (value) => controller.filterAlbums(value),
            decoration:
                const InputDecoration(hintText: AppStrings.textEditingHint),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CustomCircularProgressIndicator(),
                )
              : SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: controller.foundAlbum.value.length,
                    itemBuilder: (context, index) {
                      print(controller.foundAlbum.value.length);
                      print(controller.foundAlbum.value.length);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p14),
                        child: Card(
                          elevation: AppSize.s10,
                          child: ListTile(
                            onTap: () {
                              AutoRouter.of(context).push(DetailViewRoute(
                                  albums: controller.foundAlbum.value[index]));
                            },
                            leading: Image.network(controller
                                .foundAlbum.value[index].thumbnailUrl!),
                            title:
                                Text(controller.foundAlbum.value[index].title!),
                            subtitle: Text(controller.foundAlbum.value[index].id
                                .toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
