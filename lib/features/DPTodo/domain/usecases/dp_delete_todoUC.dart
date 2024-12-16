import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DpDeleteTodoUC extends UsecaseWithParams<void, DpDeleteTodoParams> {
  const DpDeleteTodoUC(this._repository);

  final DPtodoRepo _repository;

  @override
  ResultVoid call(DpDeleteTodoParams params) async =>
      _repository.dpdeleteTodoTaskRepo(
        params.id,
      );
}

class DpDeleteTodoParams extends Equatable {
  const DpDeleteTodoParams({
    required this.id,
  });

  const DpDeleteTodoParams.empty()
      : this(
          id: '_empty.id',
        );

  final String id;

  @override
  List<Object?> get props => [
        id,
      ];
}
