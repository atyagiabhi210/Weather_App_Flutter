part of 'bloc_bloc.dart';

sealed class BlocState extends Equatable {
  const BlocState();
  
  @override
  List<Object> get props => [];
}

final class BlocInitial extends BlocState {}

final class BlocLoading extends BlocState {}

final class BlocFailure extends BlocState {}

final class BlocSuccess extends BlocState {
 final Weather weather;
  const BlocSuccess(this.weather);
  @override
  List<Object> get props => [weather];
}


