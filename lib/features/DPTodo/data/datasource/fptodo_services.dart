import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/data/model/dptodo_model.dart';

class DPTodoDataServices {
  final CollectionReference dptodoCollection =
      FirebaseFirestore.instance.collection('dptodo');

  var user = FirebaseAuth.instance.currentUser;

//add to todo task

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

  //update todo task
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
  Future<void> dpupdateTodoStatus(String id, bool completed) async {
    return await dptodoCollection.doc(id).update({'completed': completed});
  }

//delete todo
  Future<void> dpdeleteTodoDelete(String id, bool completed) async {
    return await dptodoCollection.doc(id).delete();
  }

//get list of user todo
  Stream<List<DPTodo>> get dptodo {
    return dptodoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(_dptodoListFromSnapshot);
  }

//get list of completed todo
  Stream<List<DPTodo>> get dpcompletedTodo {
    return dptodoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: true)
        .snapshots()
        .map(_dptodoListFromSnapshot);
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
}
