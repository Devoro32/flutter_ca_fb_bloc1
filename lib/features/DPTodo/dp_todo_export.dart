//!core
export 'package:flutter_slidable/flutter_slidable.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';

//!data
export 'package:ca_firebase2_app/features/DPTodo/data/datasource/fptodo_services.dart';
export 'package:ca_firebase2_app/features/DPTodo/data/model/dptodo_model.dart';
export 'package:ca_firebase2_app/features/DPTodo/data/repository/dp_todo_repoImpl.dart';
//!domain
export 'package:ca_firebase2_app/features/DPTodo/domain/repository/dp_todo_repo.dart';
export 'package:ca_firebase2_app/features/DPTodo/domain/usecases/do_get_todoUC.dart';
export 'package:ca_firebase2_app/features/DPTodo/domain/usecases/dp_add_TodoUC.dart';
export 'package:ca_firebase2_app/features/DPTodo/domain/usecases/dp_delete_todoUC.dart';
export 'package:ca_firebase2_app/features/DPTodo/domain/usecases/dp_getcompl_todoUC.dart';
export 'package:ca_firebase2_app/features/DPTodo/domain/usecases/dp_update_todostatusUC.dart';
export 'package:ca_firebase2_app/features/DPTodo/domain/usecases/dp_update_todoUC.dart';
//!presentation
export 'package:ca_firebase2_app/features/DPTodo/presentation/views/dp_todo._view.dart';
export 'package:ca_firebase2_app/features/DPTodo/presentation/bloc/dptodo/dptodo_bloc.dart';
export 'package:ca_firebase2_app/features/DPTodo/presentation/bloc/cubit/task_tab_selection.dart';
export 'package:ca_firebase2_app/features/DPTodo/presentation/widgets/dp_pending_todo_W.dart';
export 'package:ca_firebase2_app/features/DPTodo/presentation/widgets/dp_compl_tod0_w.dart';
