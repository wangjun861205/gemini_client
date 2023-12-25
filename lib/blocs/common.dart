import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FutureState {
  const FutureState();
}

class Loading extends FutureState {
  const Loading() : super();
}

class Failed extends FutureState {
  final Object error;

  const Failed({required this.error}) : super();
}

class Success<T> extends FutureState {
  final T data;

  const Success({required this.data}) : super();
}

class FutureCubit<A, T> extends Cubit<FutureState> {
  Future<T> Function(A?) futureFactory;
  A? args;
  T? data;
  T Function(T? prev, T curr) onSuccess;

  FutureCubit(
      {required this.futureFactory,
      required this.onSuccess,
      this.args,
      this.data})
      : super(const Loading()) {
    futureFactory(args).then((res) => emit(Success(data: onSuccess(data, res))),
        onError: (e) => emit(Failed(error: e)));
  }

  factory FutureCubit.simple(
      {required Future<T> Function(A?) futureFactory, A? args}) {
    return FutureCubit(
        args: args,
        futureFactory: futureFactory,
        onSuccess: (prev, curr) => curr);
  }

  void setArgs(A args) {
    futureFactory(args).then((res) => emit(Success(data: onSuccess(data, res))),
        onError: (e) => emit(Failed(error: e)));
  }

  void refresh() {
    futureFactory(args).then((res) => emit(Success(data: onSuccess(data, res))),
        onError: (e) => emit(Failed(error: e)));
  }
}
