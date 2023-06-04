import 'package:social_media_app/data/news/data_source/news_data_source.dart';
import 'package:social_media_app/data/news/repository_impl/news_repository_impl.dart';
import 'package:social_media_app/data/news/service/news_service.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/domain/news/repository/news_repository.dart';
import 'package:social_media_app/domain/news/use_case/news_use_case.dart';

class NewsLocator {
  static void init() {
    /// Register service
    locator.registerFactory(() => NewsService());

    /// Register data source
    locator.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl(locator()));

    /// Register repository
    locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(locator()));

    /// Register use case
    locator.registerFactory(() => NewsUseCase(locator()));
  }
}