import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DpGetCompletedTodoUC extends UsecaseWithoutParams<List<DPTodo>> {
  const DpGetCompletedTodoUC(this._repository);

  final DPtodoRepo _repository;

  @override
  ResultFuture<List<DPTodo>> call() async =>
      _repository.getcompletedTodosRepo();
}
