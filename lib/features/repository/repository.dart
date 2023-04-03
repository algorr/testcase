import 'package:testcase/data/network/app_api.dart';
import 'package:testcase/features/model/albums.dart';

class Repository {
  final AppServiceClient _appServiceClient;

  Repository(this._appServiceClient);

  Future<List<Albums>> fetch() => _appServiceClient.fetch();
}
