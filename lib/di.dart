import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/remote/dio_interseptor.dart';
import 'package:investify/data/repository/auth_repository_impl.dart';
import 'package:investify/domain/auth_manager/auth_manager.dart';
import 'package:investify/presentation/signin/bloc/signin_bloc.dart';
import 'package:investify/presentation/signup/bloc/signup_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> di() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final getIt = GetIt.instance;
  // Логгирование
  final talker = TalkerFlutter.init();
  getIt.registerSingleton<Talker>(talker);
  // Загрузка .env файла
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    talker.error('Something went wrong in .env file loading');
  }
  final dio = Dio();
  // Логгирование
  dio.interceptors.add(
    TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(printResponseData: false)),
  );
  Bloc.observer = TalkerBlocObserver(talker: talker);
  getIt.registerSingleton<Dio>(dio);

  const secureStorage = FlutterSecureStorage();
  // Добавление заголовка Auth в запрос
  dio.interceptors.add(JwtInterceptor(secureStorage: secureStorage));
  // Локальное хранилище
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
  // Регистрация блоков
  final signUpBloc = SignUpBloc(AuthRepositoryImpl(dio: getIt<Dio>()));
  final signInBloc = SignInBloc(AuthRepositoryImpl(dio: getIt<Dio>()));
  getIt.registerSingleton<SignUpBloc>(signUpBloc);
  getIt.registerSingleton<SignInBloc>(signInBloc);

  final authManager = AuthManager();

  // await authManager.logout();
  await authManager.initUser();
  getIt.registerSingleton<AuthManager>(authManager);
}
