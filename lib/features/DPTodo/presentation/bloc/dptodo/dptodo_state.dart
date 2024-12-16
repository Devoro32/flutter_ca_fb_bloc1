part of 'dptodo_bloc.dart';

sealed class DptodoState extends Equatable {
  const DptodoState();

  @override
  List<Object> get props => [];
}

final class DptodoInitial extends DptodoState {
  const DptodoInitial();
}

final class DptodoLoading extends DptodoState {
  const DptodoLoading();
}

//once the task is completed
final class DptodoLoaded extends DptodoState {
  const DptodoLoaded();
}

final class DptodoSuccess extends DptodoState {
  const DptodoSuccess();
}

final class DptodoError extends DptodoState {
  const DptodoError(this.message);

  final String message;
  @override
  List<String> get props => [message];
}
