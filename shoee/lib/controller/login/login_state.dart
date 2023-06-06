import 'package:equatable/equatable.dart';


// class LoginState {
//   final bool isInitial;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isError;
//   final String errorMessage;

//   LoginState({
//     required this.isInitial,
//     required this.isLoading,
//     required this.isSuccess,
//     required this.isError,
//     required this.errorMessage,
//   });

//   LoginState copyWith({
//     bool? isInital,
//     bool? isLoading,
//     bool? isSuccess,
//     bool? isError,
//     String? errorMessage,
//   }) {
//     return LoginState(
//       isInitial: isInitial ?? this.isInitial,
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isError: isError ?? this.isError,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
// }


class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();

  @override
  List<Object> get props => [];
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();

  @override
  List<Object> get props => [];
}

class LoginStateSuccess extends LoginState {
  const LoginStateSuccess();

  @override
  List<Object> get props => [];
}

class LoginStateError extends LoginState {
  final String error;

  const LoginStateError(this.error);

  @override
  List<Object> get props => [error];
}

class LoginStateOut extends LoginState {
  const LoginStateOut();

  @override
  List<Object> get props => [];
}

class MsgPush extends LoginState {
  final String msg;

  const MsgPush(this.msg);

  @override
  List<Object> get props => [msg];
}