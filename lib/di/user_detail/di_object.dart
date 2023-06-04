import 'package:social_media_app/data/user_detail/data_source/user_detail_local_data_source.dart';
import 'package:social_media_app/data/user_detail/repository_impl/user_detail_local_repository_impl.dart';
import 'package:social_media_app/data/user_detail/services/user_detail_api_service.dart';
import 'package:social_media_app/data/user_detail/data_source/user_detail_data_source.dart';
import 'package:social_media_app/data/user_detail/repository_impl/user_detail_repository_impl.dart';
import 'package:social_media_app/data/user_detail/services/user_detail_local_service.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_local_repository.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_repository.dart';
import 'package:social_media_app/domain/user_detail/use_case/user_detail_use_case.dart';

class UserDetailLocator {
  static void init() {
    /// Register service
    locator.registerFactory(() => UserDetailApiService());
    locator.registerFactory(() => UserDetailLocalService());

    /// Register data source
    locator.registerLazySingleton<UserDetailDataSource>(() => UserDetailDataSourceImpl(locator()));
    locator.registerLazySingleton<UserDetailLocalDataSource>(() => UserDetailLocalDataSourceImpl(locator()));

    /// Register repository
    locator.registerLazySingleton<UserDetailRepository>(() => UserDetailRepositoryImpl(locator()));
    locator.registerLazySingleton<UserDetailLocalRepository>(() => UserDetailLocalRepositoryImpl(locator()));

    /// Register use case
    locator.registerFactory(() => UserDetailUseCase(locator(), locator()));
  }
}