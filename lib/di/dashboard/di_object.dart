import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/presentation/dashboard/bloc/dashboard_bloc.dart';

class DashboardLocator {
  static void init() {
    /// Register bloc
    locator.registerFactory(() => DashboardBloc());
  }
}