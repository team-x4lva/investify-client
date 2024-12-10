import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investify/data/models/user/user.dart';
import 'package:investify/data/models/user/user_registration/user_registration.dart';
import 'package:investify/domain/auth_manager/auth_manager.dart';
import 'package:investify/domain/repository/auth_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepostory;
  SignUpBloc(this.authRepostory) : super(SignUpInitial()) {
    final talker = GetIt.I<Talker>();
    on<SignUpWithEmailPassword>((event, emit) async {
      await _onSignUp(emit, event, talker);
    });
  }

  Future<void> _onSignUp(Emitter<SignUpState> emit,
      SignUpWithEmailPassword event, Talker talker) async {
    emit(SignUpInProgress());
    try {
      // FIXME: Delete delay
      await Future.delayed(const Duration(seconds: 2));
      final authManager = GetIt.I<AuthManager>();
      final id = await authRepostory.signUp(UserRegistration(
          username: event.email, email: event.email, password: event.password));
      final jwtToken = await authRepostory
          .signIn(User(username: event.email, password: event.password));
      await authManager.setId(id);
      await authManager.loggin(jwtToken);
      emit(SignUpSuccess());
      talker.log(jwtToken);
    } catch (e) {
      emit(SignUpError());
      talker
          .error('Something went wrong in signin proccess. Error message: $e');
    }
  }
}
