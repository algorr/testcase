import 'package:get/get.dart';
import 'package:testcase/features/model/albums.dart';
import 'package:testcase/features/repository/repository.dart';

class Controller extends GetxController {
  Controller(this._repository);
  final Repository _repository;

  var albums = <Albums>[].obs;
  var isLoading = false.obs;

  Rx<List<Albums>> foundAlbum = Rx<List<Albums>>([]);
  //var searchResult = <Albums>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlbums();

    foundAlbum.value = albums.obs.value;
  }

  Future<void> fetchAlbums() async {
    try {
      toggleLoadingState();
      final response = await _repository.fetch();

      if (response.isNotEmpty) {
        albums = response.obs;
      }
      toggleLoadingState();
      update();
    } catch (e) {
      throw Exception();
    }
  }

  void toggleLoadingState() {
    isLoading.value = !isLoading.value;
  }

  void filterAlbums(String text) {
    List<Albums> result = [];
    if (text.isEmpty) {
      result = albums;
    } else {
      result = albums
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    }
    foundAlbum.value = result;
  }
}
