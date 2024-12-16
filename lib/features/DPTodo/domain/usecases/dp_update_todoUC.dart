import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DpUpdateTodoUC extends UsecaseWithParams<void, DpUpdateTodoTaskParams> {
  const DpUpdateTodoUC(this._repository);

  final DPtodoRepo _repository;

  @override
  ResultVoid call(DpUpdateTodoTaskParams params) async =>
      _repository.dpupdateTodoTaskRepo(
        id: params.id,
        title: params.title,
        description: params.description,
      );
}

class DpUpdateTodoTaskParams extends Equatable {
  const DpUpdateTodoTaskParams({
    required this.id,
    required this.title,
    required this.description,
  });

  const DpUpdateTodoTaskParams.empty()
      : this(
          id: '_empty.id',
          title: '_empty.title',
          description: '_empty.description',
        );

  final String id;
  final String title;
  final String description;

  @override
  List<Object?> get props => [id, title];
}
