import 'package:ca_firebase2_app/export.dart';

import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

class DPTodoHomeScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const DPTodoHomeScreen());
  const DPTodoHomeScreen({super.key});

  @override
  State<DPTodoHomeScreen> createState() => _DPTodoHomeScreenState();
}

class _DPTodoHomeScreenState extends State<DPTodoHomeScreen> {
  final _widgets = [
    //Pending Task widget

    DPPendingTodoWidget(),
    //Completed Tasks
    DPComplToDoWidget(),
  ];
  // int _buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.greyColor,
        title: Text('DP To Do Home Screen'),
        actions: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(const DBFBSignOutEvent());
                    Navigator.pushReplacement(context, SignInPage.route());
                    print('Signout button clicked');
                  },
                  icon: const Icon(Icons.exit_to_app));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<TaskTabSelectionCubit, int>(
                    builder: (context, state) {
                      //?Tab button
                      return InkWell(
                        onTap: () {
                          context.read<TaskTabSelectionCubit>().selectedTab(0);
                          var result = context
                              .read<TaskTabSelectionCubit>()
                              .selectedIndex;
                          print("Result selection 0: $result");
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.2,
                          decoration: BoxDecoration(
                              color: context
                                          .watch<TaskTabSelectionCubit>()
                                          .selectedIndex ==
                                      0
                                  ? AppPallete.gradient1
                                  : AppPallete.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Pending',
                              style: TextStyle(
                                fontSize: context
                                            .read<TaskTabSelectionCubit>()
                                            .selectedIndex ==
                                        0
                                    ? 16
                                    : 14,
                                fontWeight: FontWeight.w500,
                                color: context
                                            .read<TaskTabSelectionCubit>()
                                            .selectedIndex ==
                                        0
                                    ? AppPallete.whiteColor
                                    : AppPallete.blackColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      context.read<TaskTabSelectionCubit>().selectedTab(1);

                      var result =
                          context.read<TaskTabSelectionCubit>().selectedIndex;
                      print("Result selection 1: $result");
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                          color: context
                                      .watch<TaskTabSelectionCubit>()
                                      .selectedIndex ==
                                  1
                              ? AppPallete.gradient1
                              : AppPallete.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            fontSize: context
                                        .read<TaskTabSelectionCubit>()
                                        .selectedIndex ==
                                    1
                                ? 16
                                : 14,
                            fontWeight: FontWeight.w500,
                            color: context
                                        .read<TaskTabSelectionCubit>()
                                        .selectedIndex ==
                                    1
                                ? AppPallete.whiteColor
                                : AppPallete.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _widgets[context.read<TaskTabSelectionCubit>().selectedIndex],
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPallete.whiteColor,
        onPressed: () {
          _showTaskDialog(
            context,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showTaskDialog(BuildContext context, {DPTodo? todo}) {
    final TextEditingController _titleController =
        TextEditingController(text: todo?.title);
    final TextEditingController _descriptionController =
        TextEditingController(text: todo?.description);
    // final DatabaseService _databaseService = DatabaseService();

    showDialog(
        context: context,
        builder: (context) {
          return BlocBuilder<DptodoBloc, DptodoState>(
            builder: (context, state) {
              return AlertDialog(
                backgroundColor: AppPallete.whiteColor,
                title: Center(
                  child: Text(
                    todo == null ? 'Add Task' : 'Edit Task',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppPallete.blackColor,
                    ),
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(color: AppPallete.blackColor),
                        controller: _titleController,
                        decoration: const InputDecoration(
                            labelText: 'Title', border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: const TextStyle(color: AppPallete.blackColor),
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (todo == null) {
                        context.read<DptodoBloc>().add(DPAddTodoTaskEvent(
                              title: _titleController.text,
                              description: _descriptionController.text,
                            ));
                      } else {
                        context.read<DptodoBloc>().add(DPUpdateTodoEvent(
                              id: todo.id,
                              title: _titleController.text,
                              description: _descriptionController.text,
                            ));
                      }

                      Navigator.pop(context);
                    },
                    child: todo == null
                        ? const Text('Save')
                        : const Text('Update'),
                  ),
                ],
              );
            },
          );
        });
  }
}
