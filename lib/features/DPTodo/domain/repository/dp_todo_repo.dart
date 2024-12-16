import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/data/model/dptodo_model.dart';

abstract class DPtodoRepo {
  const DPtodoRepo();

  //TODO: Can use type def and DBAuthUserCreationReqModel
  ResultVoid dpaddTodoTaskRepo({
    required String title,
    required String description,
  });
  ResultVoid dpupdateTodoTaskRepo({
    required String id,
    required String title,
    required String description,
  });

  ResultVoid dpUpdateTodoStatusRepo(String id, bool completed);

  ResultVoid dpdeleteTodoTaskRepo(String id);
  ResultFuture<List<DPTodo>> getTodosRepo();
  ResultFuture<List<DPTodo>> getcompletedTodosRepo();

  //   Future<Either> sendPasswordResetEmail(String email);
  // Future<bool> isLoggedIn();
  // Future<Either> getUser();
}
