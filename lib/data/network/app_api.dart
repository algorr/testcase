import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testcase/app/constants.dart';
import 'package:testcase/features/model/albums.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/photos")
  Future<List<Albums>> fetch();
}
