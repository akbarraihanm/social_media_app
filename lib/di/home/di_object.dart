import 'package:social_media_app/data/home/api/home_service.dart';
import 'package:social_media_app/data/home/data_source/home_data_source.dart';
import 'package:social_media_app/data/home/repository_impl/home_repository_impl.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/domain/home/repository/home_repository.dart';
import 'package:social_media_app/domain/home/use_case/home_use_case.dart';

class HomeLocator {
  static void init() {
    /// Register service
    locator.registerFactory(() => HomeService());

    /// Register data source
    locator.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl(locator()));

    /// Register repository
    locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(locator()));

    /// Register use case
    locator.registerFactory(() => HomeUseCase(locator()));
  }
}