class DBAuthUserCreationReqModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  DBAuthUserCreationReqModel(
      {required this.firstName,
      required this.email,
      required this.lastName,
      required this.password});
}
