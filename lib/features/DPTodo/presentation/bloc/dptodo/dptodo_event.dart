part of 'dptodo_bloc.dart';

sealed class DptodoEvent extends Equatable {
  const DptodoEvent();

  @override
  List<Object> get props => [];
}

class DPUpdateTodoEvent extends DptodoEvent {
  const DPUpdateTodoEvent({
    required this.id,
    required this.title,
    required this.description,
  });

  final String id;
  final String title;
  final String description;

  @override
  List<Object> get props => [id, title];
}

class DPUpdateTodoStatusEvent extends DptodoEvent {
  const DPUpdateTodoStatusEvent({
    required this.id,
    required this.completed,
  });

  final String id;
  final bool completed;

  @override
  List<Object> get props => [
        id,
      ];
}

class DPAddTodoTaskEvent extends DptodoEvent {
  const DPAddTodoTaskEvent({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  List<Object> get props => [title, description];
}

class DPDeleteTodoTaskEvent extends DptodoEvent {
  const DPDeleteTodoTaskEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}
