import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/remote/models/user/user.dart';
import 'package:investify/domain/auth_manager/auth_manager.dart';
import 'package:investify/domain/remote_repositories/auth_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;
  SignInBloc(this.authRepository) : super(SignInInitial()) {
    final talker = GetIt.I<Talker>();
    on<SignInWithEmailPassword>((event, emit) async {
      await _onSignIn(emit, event, talker);
    });
  }

  Future<void> _onSignIn(Emitter<SignInState> emit,
      SignInWithEmailPassword event, Talker talker) async {
    emit(SignInInProgress());
    try {
      // FIXME: Delete delay
      await Future.delayed(const Duration(seconds: 2));
      final authManager = GetIt.I<AuthManager>();
      final jwtToken = await authRepository
          .signIn(User(username: event.email, password: event.password));
      await authManager.loggin(jwtToken);
      emit(SignInSuccess());
      talker.log(jwtToken);
    } catch (e, st) {
      emit(SignInError());
      talker.handle(e, st);
    }
  }
}
