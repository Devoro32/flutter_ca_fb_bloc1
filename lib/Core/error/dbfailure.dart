import 'package:ca_firebase2_app/export.dart';

// class DBFailure extends Equatable {
//   const DBFailure({
//     required this.message,
//   });

//   final String message;

//   String get errorMessage => 'Error: $message';

//   @override
//   List<Object> get props => [message];
// }

// class APIFailure extends DBFailure {
//   const APIFailure({
//     required super.message,
//   });

//   APIFailure.fromException(APIException exception)
//       : this(
//           message: exception.message,
//         );
// }

class DBFailure extends Equatable {
  final String message;

  const DBFailure([this.message = 'An unexpected error occurred']);

  @override
  List<Object> get props => [message];
}
