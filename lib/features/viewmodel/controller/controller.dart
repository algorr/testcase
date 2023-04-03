import 'package:get/get.dart';
import 'package:testcase/features/model/albums.dart';
import 'package:testcase/features/repository/repository.dart';

class Controller extends GetxController {
  Controller(this._repository);
  final Repository _repository;

  var albums = <Albums>[].obs;
  var isLoading = false.obs;

  Rx<List<Albums>> foundAlbum = Rx<List<Albums>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchAlbums();
    foundAlbum.value = albums;
  }

//* fetch data from api
  Future<void> fetchAlbums() async {
    try {
      toggleLoadingState();
      final response = await _repository.fetch();

      if (response.isNotEmpty) {
        albums = response.obs;
        foundAlbum.value = albums;
      }
      toggleLoadingState();
    } catch (e) {
      throw Exception();
    }
  }

//* toggle isLoading value
  void toggleLoadingState() {
    isLoading.value = !isLoading.value;
  }

//* filter albums
  void filterAlbums(String text) {
    List<Albums> result = [];
    if (text.isEmpty) {
      result = albums;
      update();
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
