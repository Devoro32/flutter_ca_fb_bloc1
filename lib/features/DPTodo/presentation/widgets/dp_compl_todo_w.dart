

//TODO: Need to convert from Stream to Bloc

/*
import 'package:ca_firebase2_app/export.dart';

import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DPComplToDoWidget extends StatefulWidget {
  const DPComplToDoWidget({super.key});

  @override
  State<DPComplToDoWidget> createState() => _DPComplToDoWidgetState();
}

class _DPComplToDoWidgetState extends State<DPComplToDoWidget> {
   //? Get the user details, everything below this line are totally wrong
  //TODO: Need to fix this section regarding the TODO tasks  add
  User? user = FirebaseAuth.instance.currentUser;
  late String uid;

//?This should be bloc bringing in the data for this based on the query
  final  DatabaseSercie  _databaseService= DatabaseService();
  
  @override
void initState(){
  //https://youtu.be/MMo3gghipN4?t=2981
  super.initState();
  //? This should be pulled in via firebase see Ecommerce/blog
  uid= FirebaseAuth.instance.currentUser!.uid;
}


  @override
  Widget build(BuildContext context) {
    //!Doesn't work with stream
    return Stream<List<Todo>>(
        stream: _databaseService.completedTodos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DPTodo> todos = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                DPTodo todo = todo[index];
                final DateTime dt =todo.timeStamp.toDate()
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                     
                  ),
                  child: Slidable(
                    
                    key: ValueKey(todo.id),
                    endActionPane: ActionPane(motion: DrawerMotion(), children: [
                      SlidableAction(
                        
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.done,
                        label: 'Mark',
                        onPressed: (context){
                        //TODO: Bloc updateTodoStatus goes here
                        _databaseService.updateTodoStatus(todo.id, true);

                      }),
             
                    ]),
                    startActionPane: ActionPane(motion: DrawerMotion(), children: [
                      
                         SlidableAction(
                        
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.done,
                        label: 'Delete',
                        onPressed: (context)async{
                        //TODO: Bloc updateTodoStatus goes here
                        await _databaseService.deleteTodoTask(todo.id);

                      }),
                    ]),
                    child: ListTile(
                      title:Text(
                           todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        
                        ),
                      
                      ),
                     subtitle:Text(
                           todo.description,
                                          
                      ), 
                      trailing: Text('${dt.day}/${dt.month}/${dt.year}', 
                     style: TextStyle(fontWeight: FontWeight.bold,),),
                    
                    ),),
                );
              },
            );
          } else {
            return Center(
              child: const CircularProgressIndicator(color: Colors.white,),
            );
          }
        });
  }
}
*/