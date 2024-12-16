import 'package:bloc/bloc.dart';
import 'package:ca_firebase2_app/export.dart';
import 'package:equatable/equatable.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';
part 'dptodo_event.dart';
part 'dptodo_state.dart';

class DptodoBloc extends Bloc<DptodoEvent, DptodoState> {
  DptodoBloc({
    required DpAddTodoUC dpAddTodoUC,
    required DpDeleteTodoUC dpDeleteTodoUC,
    required DpUpdateTodoStatusUC dpUpdateTodoStatusUC,
    required DpUpdateTodoUC dpUpdateTodoUC,
  })  : _dpAddTodoUC = dpAddTodoUC,
        _dpDeleteTodoUC = dpDeleteTodoUC,
        _dpUpdateTodoStatusUC = dpUpdateTodoStatusUC,
        _dpUpdateTodoUC = dpUpdateTodoUC,
        super(DptodoInitial()) {
    on<DPUpdateTodoEvent>(_dpUpdateTodoHandler);
    on<DPUpdateTodoStatusEvent>(_dpUpdateTodoStatusHandler);
    on<DPAddTodoTaskEvent>(_dpAddTodoTaskHandler);
    on<DPDeleteTodoTaskEvent>(_dpDeleteTodoTaskHandler);
  }

  final DpAddTodoUC _dpAddTodoUC;
  final DpDeleteTodoUC _dpDeleteTodoUC;
  final DpUpdateTodoStatusUC _dpUpdateTodoStatusUC;
  final DpUpdateTodoUC _dpUpdateTodoUC;

  Future<void> _dpUpdateTodoHandler(
      DPUpdateTodoEvent event, Emitter<DptodoState> emit) async {
    emit(const DptodoLoading());
    final result = await _dpUpdateTodoUC(DpUpdateTodoTaskParams(
      id: event.id,
      title: event.title,
      description: event.description,
    ));

    result.fold((failure) => emit(DptodoError(failure.message)),
        (_) => emit(const DptodoSuccess()));
  }

  Future<void> _dpUpdateTodoStatusHandler(
      DPUpdateTodoStatusEvent event, Emitter<DptodoState> emit) async {
    emit(const DptodoLoading());

    final result = await _dpUpdateTodoStatusUC(DpUpdateTodoStatusParams(
      id: event.id,
      completed: event.completed,
    ));
    result.fold((failure) => emit(DptodoError(failure.message)),
        (_) => emit(const DptodoSuccess()));
  }

  Future<void> _dpAddTodoTaskHandler(
      DPAddTodoTaskEvent event, Emitter<DptodoState> emit) async {
    emit(const DptodoLoading());

    final result = await _dpAddTodoUC(DpAddTodoParams(
      title: event.title,
      description: event.description,
    ));

    result.fold((failure) => emit(DptodoError(failure.message)),
        (_) => emit(const DptodoSuccess()));
  }

  Future<void> _dpDeleteTodoTaskHandler(
      DPDeleteTodoTaskEvent event, Emitter<DptodoState> emit) async {
    emit(const DptodoLoading());
    final result = await _dpDeleteTodoUC(DpDeleteTodoParams(id: event.id));
    result.fold((failure) => emit(DptodoError(failure.message)),
        (_) => emit(const DptodoSuccess()));
  }
}
