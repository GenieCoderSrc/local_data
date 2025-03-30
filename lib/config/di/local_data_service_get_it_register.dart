import 'package:local_data/local_data.dart';
import 'package:global/get_it_di.dart';
import 'package:shared_preferences/shared_preferences.dart';

void localDataServiceGetItRegister() async {
  /// ----------------- Local Data--------------
  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);

  /// Service
  sl.registerLazySingleton<IMemoryStorageService>(
      () => CacheStorageServiceSharedPrefsImpl(prefs: sl()));

  sl.registerLazySingleton<ILocalDataService>(
      () => LocalDataServiceHydratedImpl());
}
