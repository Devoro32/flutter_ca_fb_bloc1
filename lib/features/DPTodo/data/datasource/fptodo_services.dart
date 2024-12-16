import 'dart:ffi';

import 'package:ca_firebase2_app/export.dart';
// import 'package:fpdart/fpdart.dart';
import 'package:ca_firebase2_app/features/DPTodo/data/model/dptodo_model.dart';

abstract class DPTodoDataServices {
  Future<DocumentReference> dpaddTodoTask(
    String title,
    String description,
  );
  Future<void> dpupdateTodoTask(
    String id,
    String title,
    String description,
  );
  Future<void> dpupdateTodoStatus(
    String id,
    bool completed,
  );
  Future<void> dpdeleteTodoTask(
    String id,
  );
  //TODO: How to use get with stream? changing to Futures
  // Stream<List<DPTodo>> dptodos;
  Future<List<DPTodo>> dptodos();

  //TODO: How to use get with stream? changing to Futures
  //Stream<List<DPTodo>> get dpcompletedTodo;
  Future<List<DPTodo>> dpcompletedTodo();
}

class DPTodoDataServicesImpl implements DPTodoDataServices {
  final CollectionReference dptodoCollection =
      FirebaseFirestore.instance.collection('dptodo');

  var user = FirebaseAuth.instance.currentUser;

//add to todo task

  @override
  Future<DocumentReference> dpaddTodoTask(
      String title, String description) async {
    return await dptodoCollection.add({
      'uid': user!.uid,
      'title': title,
      'description': description,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp()
    });
  }

  @override //update todo task
  Future<void> dpupdateTodoTask(
      String id, String title, String description) async {
    final dpupdatetodoCollection =
        FirebaseFirestore.instance.collection('dptodo').doc(id);
    return await dpupdatetodoCollection.update({
      'title': title,
      'description': description,
    });
  }

//update todo status

  @override
  Future<void> dpupdateTodoStatus(String id, bool completed) async {
    return await dptodoCollection.doc(id).update({'completed': completed});
  }

//delete todo

  @override
  Future<void> dpdeleteTodoTask(String id) async {
    return await dptodoCollection.doc(id).delete();
  }

//get list of user todo
  @override
  // Stream<List<DPTodo>> dptodos {
  //   return dptodoCollection
  //       .where('uid', isEqualTo: user!.uid)
  //       .where('completed', isEqualTo: false)
  //       .snapshots()
  //       .map(_dptodoListFromSnapshot);
  // }
  Future<List<DPTodo>> dptodos() {
    return dptodoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .get()
        .then(_dptodoListFromSnapshot);
  }

//get list of completed todo

  @override
  // Stream<List<DPTodo>> dpcompletedTodo {
  //   return dptodoCollection
  //       .where('uid', isEqualTo: user!.uid)
  //       .where('completed', isEqualTo: true)
  //       .snapshots()
  //       .map(_dptodoListFromSnapshot);
  // }

//?can look at ecommerce blog getUser to see how it is done
  Future<List<DPTodo>> dpcompletedTodo() async {
    return dptodoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: true)
        .get()
        .then(_dptodoListFromSnapshot);
  }

  List<DPTodo> _dptodoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return DPTodo(
          id: doc.id,
          title: doc['title'] ?? '',
          description: doc['description'] ?? '',
          completed: doc['completed'] ?? false,
          timeStamp: doc['createdAt'] ?? '');
    }).toList();
  }

//?Example from Ecommerce
  //   Future<Either> getUser() async {
  //   try {
  //     var currentUser = FirebaseAuth.instance.currentUser;
  //     var userData = await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(currentUser?.uid)
  //         .get()
  //         .then((value) => value.data());
  //     return Right(userData);
  //   } catch (e) {
  //     return const Left('Please try again');
  //   }
  // }
}
