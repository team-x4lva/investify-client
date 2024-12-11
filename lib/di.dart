import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/local/models/portfolio/portfolio_isar_model.dart';
import 'package:investify/data/local/models/security/security_isar_model.dart';
import 'package:investify/data/local_repositories/portfolio_repository.dart';
import 'package:investify/data/remote/dio_interseptor.dart';
import 'package:investify/data/remote_repositories/auth_repository_impl.dart';
import 'package:investify/data/remote_repositories/portfolio_repository_impl.dart';
import 'package:investify/domain/auth_manager/auth_manager.dart';
import 'package:investify/presentation/details/bloc/details_bloc.dart';
import 'package:investify/presentation/generated_portfolio/bloc/generated_portfolio_bloc.dart';
import 'package:investify/presentation/signin/bloc/signin_bloc.dart';
import 'package:investify/presentation/signup/bloc/signup_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
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
        settings: const TalkerDioLoggerSettings(printResponseData: true)),
  );
  Bloc.observer = TalkerBlocObserver(talker: talker);
  getIt.registerSingleton<Dio>(dio);

  // Локальное хранилище для авторизации
  const secureStorage = FlutterSecureStorage();
  // Добавление заголовка Auth в запрос
  dio.interceptors.add(JwtInterceptor(secureStorage: secureStorage));
  //
  getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

  // Дериктория для локальной бд
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([SecurityIsarSchema, PortfolioIsarSchema],
      directory: dir.path);
  getIt.registerSingleton<Isar>(isar);

  // Регистрация блоков
  final signUpBloc = SignUpBloc(AuthRepositoryImpl(dio: getIt<Dio>()));
  final signInBloc = SignInBloc(AuthRepositoryImpl(dio: getIt<Dio>()));
  final detailsBloc = DetailsBloc(PortfolioRepositoryImpl(dio: getIt<Dio>()));
  final generatedBloc =
      GeneratedPortfolioBloc(LocalPortfolioRepositoryImpl(storage: isar));
  getIt.registerSingleton<SignUpBloc>(signUpBloc);
  getIt.registerSingleton<SignInBloc>(signInBloc);
  getIt.registerSingleton<DetailsBloc>(detailsBloc);
  getIt.registerSingleton<GeneratedPortfolioBloc>(generatedBloc);

  final authManager = AuthManager();

  // await authManager.logout();
  await authManager.initUser();
  getIt.registerSingleton<AuthManager>(authManager);
}
