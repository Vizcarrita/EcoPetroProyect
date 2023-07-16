import 'package:example_ecopetro/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example_ecopetro/features/shared/shared.dart';
import 'package:formz/formz.dart';

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email correo;
  final Password pass;

  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.correo = const Email.pure(),
    this.pass = const Password.pure(),
  });

  LoginFormState copyWhit({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? correo,
    Password? pass,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        correo: correo ?? this.correo,
        pass: pass ?? this.pass,
      );

  @override
  String toString() {
    return '''
  LoginFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    correo: $correo
    pass: $pass
''';
  }
}

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final Function(String, String) loginUserCallback;

  LoginFormNotifier({
    required this.loginUserCallback,
  }) : super(LoginFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWhit(
        correo: newEmail, isValid: Formz.validate([newEmail, state.pass]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWhit(
        pass: newPassword,
        isValid: Formz.validate([newPassword, state.correo]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (state.isValid) return;
    await loginUserCallback(state.correo.value, state.pass.value);
  }

  _touchEveryField() {
    final correo = Email.dirty(state.correo.value);
    final pass = Password.dirty(state.pass.value);

    state = state.copyWhit(
        isFormPosted: true,
        correo: correo,
        pass: pass,
        isValid: Formz.validate([correo, pass]));
  }
}

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;

  return LoginFormNotifier(
    loginUserCallback: loginUserCallback,
  );
});
