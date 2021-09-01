
import 'package:get_it/get_it.dart';
import 'package:newsmedia/data/repositories/news/news_repository.dart';
import 'package:newsmedia/data/services/base/endpoint.dart';
import 'package:newsmedia/data/services/news/news_services.dart';

GetIt injector = GetIt.instance;
void setupInjector() {
  /// Registering API Endpoint
  injector.registerLazySingleton(() => APIEndpoint());

  /// Registering Services
  injector.registerSingleton(NewsServices());

  /// Registering Repositories 
  injector.registerSingleton(NewsRepository());
}