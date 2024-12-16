import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DpGetTodoUC extends UsecaseWithoutParams<List<DPTodo>> {
  const DpGetTodoUC(this._repository);

  final DPtodoRepo _repository;

  @override
  ResultFuture<List<DPTodo>> call() async => _repository.getTodosRepo();
}
