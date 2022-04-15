import 'package:get_it/get_it.dart';

/// create global instance
void registerSingleton<T extends Object>(T instance) {
  GetIt.I.registerSingleton<T>(instance);
}

/// get global instance
T getSingleton<T extends Object>() {
  return GetIt.I.get<T>();
}
