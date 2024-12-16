import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DpUpdateTodoStatusUC
    extends UsecaseWithParams<void, DpUpdateTodoStatusParams> {
  const DpUpdateTodoStatusUC(this._repository);

  final DPtodoRepo _repository;

  @override
  ResultVoid call(DpUpdateTodoStatusParams params) async =>
      _repository.dpUpdateTodoStatusRepo(
        params.id,
        params.completed,
      );
}

class DpUpdateTodoStatusParams extends Equatable {
  const DpUpdateTodoStatusParams({
    required this.id,
    required this.completed,
  });

  const DpUpdateTodoStatusParams.empty()
      : this(
          id: '_empty.id',
          completed: false,
        );

  final String id;
  final bool completed;

  @override
  List<Object?> get props => [
        id,
      ];
}
