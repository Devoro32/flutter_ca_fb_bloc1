import 'package:ca_firebase2_app/Core/utils/typedef.dart';
import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';
import 'package:fpdart/fpdart.dart';

class DPtodoRepoImpl implements DPtodoRepo {
  const DPtodoRepoImpl(this._dptodoDataServices);

  final DPTodoDataServices _dptodoDataServices;

  @override
  ResultVoid dpupdateTodoTaskRepo(
      {required String id,
      required String title,
      required String description}) async {
    try {
      await _dptodoDataServices.dpupdateTodoTask(id, title, description);
      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  ResultVoid dpUpdateTodoStatusRepo(String id, bool completed) async {
    try {
      await _dptodoDataServices.dpupdateTodoStatus(id, completed);
      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  ResultVoid dpaddTodoTaskRepo({
    required String title,
    required String description,
  }) async {
    try {
      await _dptodoDataServices.dpaddTodoTask(title, description);
      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  ResultVoid dpdeleteTodoTaskRepo(String id) async {
    try {
      await _dptodoDataServices.dpdeleteTodoTask(id);
      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  ResultFuture<List<DPTodo>> getTodosRepo() async {
    try {
      var result = await _dptodoDataServices.dptodos();
      return Right(result);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  ResultFuture<List<DPTodo>> getcompletedTodosRepo() async {
    try {
      var result = await _dptodoDataServices.dpcompletedTodo();
      return Right(result);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }
}
