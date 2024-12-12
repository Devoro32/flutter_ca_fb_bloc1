import 'package:fpdart/fpdart.dart';
import 'package:ca_firebase2_app/export.dart';

typedef ResultFuture<T> = Future<Either<DBFailure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef ResultBool = Future<bool>;

typedef DataMap = Map<String, dynamic>;
