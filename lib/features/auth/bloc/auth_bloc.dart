import 'package:bloc/bloc.dart';

import 'package:chat_app_firebase/features/auth/domain/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _usecase = AuthUseCase();
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await _usecase.signIn(event.email, event.password);
        emit(AuthSukses(message: "Berhasil Login"));
      } catch (e) {
        emit(AuthFailed(message: e.toString()));
      }
    });
    on<LogoutEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await _usecase.logOut();
        emit(AuthSukses(message: "Berhasil Login"));
      } catch (e) {
        emit(AuthFailed(message: e.toString()));
      }
    });
  }
}
