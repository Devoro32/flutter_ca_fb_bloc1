import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DpAddTodoUC extends UsecaseWithParams<void, DpAddTodoParams> {
  const DpAddTodoUC(this._repository);

  final DPtodoRepo _repository;

  @override
  ResultVoid call(DpAddTodoParams params) async =>
      _repository.dpaddTodoTaskRepo(
        title: params.title,
        description: params.description,
      );
}

class DpAddTodoParams extends Equatable {
  const DpAddTodoParams({
    required this.title,
    required this.description,
  });

  const DpAddTodoParams.empty()
      : this(
          title: '_empty.title',
          description: '_empty.description',
        );

  final String title;
  final String description;

  @override
  List<Object?> get props => [title, description];
}
