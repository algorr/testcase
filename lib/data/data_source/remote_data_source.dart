import 'package:testcase/data/network/app_api.dart';
import 'package:testcase/features/model/albums.dart';

abstract class RemoteDataSource {
  Future<List<Albums>> fetchCats();
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  RemoteDataSourceImplementer(this._appServiceClient);
  final AppServiceClient _appServiceClient;

  @override
  Future<List<Albums>> fetchCats() {
    return _appServiceClient.fetch();
  }
}
