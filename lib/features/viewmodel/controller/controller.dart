// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';

import 'package:testcase/features/model/albums.dart';
import 'package:testcase/features/repository/repository.dart';

class Controller extends GetxController {
  Controller(this._repository);
  final Repository _repository;

  var albums = <Albums>[].obs;
  var isLoading = false.obs;

  Rx<List<Albums>> foundAlbum = Rx<List<Albums>>([]);
  var searchResult = <Albums>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
    foundAlbum.value = albums;
  }

  Future<void> fetchPhotos() async {
    try {
      toggleLoadingState();
      final response = await _repository.fetch();

      if (response.isNotEmpty) {
        albums = response.obs;
      }
      toggleLoadingState();
      update();
    } catch (e) {}
  }

  void toggleLoadingState() {
    isLoading.value = !isLoading.value;
  }

  void filterAlbums(String title) {
    List<Albums> result = [];
    if (title.isEmpty) {
      result = albums;
    } else {
      result = albums
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(title.toLowerCase()))
          .toList();
    }
    foundAlbum.value = result;
  }
}
