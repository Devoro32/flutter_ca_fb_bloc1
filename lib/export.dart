//!packages
export 'package:flutter/material.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:ca_firebase2_app/firebase_options.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:get_it/get_it.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:ca_firebase2_app/init_dependencies.dart';
export 'package:equatable/equatable.dart';

//!core
export 'package:ca_firebase2_app/Core/themes/theme.dart';
export 'package:ca_firebase2_app/Core/themes/app_pallete.dart';
export 'package:ca_firebase2_app/Core/utils/show_snackbar.dart';
export 'package:ca_firebase2_app/Core/widgets/loader.dart';
export 'package:ca_firebase2_app/Core/error/failures.dart';
export 'package:ca_firebase2_app/Core/usecases/core_usecases.dart';
export 'package:ca_firebase2_app/Core/bloc_cubit/app_user/app_user_cubit.dart';
export 'package:ca_firebase2_app/Core/utils/constants.dart';
export 'package:ca_firebase2_app/Core/widgets/header.dart';
export 'package:ca_firebase2_app/Core/bloc_cubit/DisplayInfo/user_info_display_cubit.dart';
export 'package:ca_firebase2_app/features/main_page.dart';
//!Home

//presentation

// export 'package:ca_firebase2_app/features/home/presentation/pages/homepage.dart';

//!Authentication

//core
export 'package:ca_firebase2_app/Core/error/dbexceptions.dart';
export 'package:ca_firebase2_app/Core/error/dbfailure.dart';
export 'package:ca_firebase2_app/Core/usecases/usecase.dart';
export 'package:ca_firebase2_app/Core/utils/typedef.dart';
//data

export 'package:ca_firebase2_app/features/authentication/data/repositories/authentication_repository_implementation.dart';
export 'package:ca_firebase2_app/features/authentication/data/models/user_model.dart';
export 'package:ca_firebase2_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
export 'package:ca_firebase2_app/features/authentication/data/models/db_user_creation_req_mod.dart';
//domain
export 'package:ca_firebase2_app/features/authentication/domain/entities/user.dart';
export 'package:ca_firebase2_app/features/authentication/domain/repositories/authentication_repository.dart';
export 'package:ca_firebase2_app/features/authentication/domain/usecases/db_auth_signup_uc.dart';
export 'package:ca_firebase2_app/features/authentication/domain/usecases/db_auth_signin_uc.dart';
export 'package:ca_firebase2_app/features/authentication/domain/usecases/db_auth_getUser_uc.dart';
export 'package:ca_firebase2_app/features/authentication/domain/usecases/db_auth_isLoggedIn_uc.dart';
export 'package:ca_firebase2_app/features/authentication/domain/usecases/db_auth_sendpw_uc.dart';

//presentation

export 'package:ca_firebase2_app/features/authentication/presentation/widgets/loading_column.dart';
export 'package:ca_firebase2_app/features/authentication/presentation/widgets/auth_field.dart';
export 'package:ca_firebase2_app/features/authentication/presentation/widgets/auth_gradient_button.dart';
export 'package:ca_firebase2_app/features/authentication/presentation/views/signin_page.dart';
export 'package:ca_firebase2_app/features/authentication/presentation/views/signup_page.dart';
export 'package:ca_firebase2_app/features/authentication/presentation/views/sign_in_page_cubit.dart';
export 'package:ca_firebase2_app/features/authentication/domain/usecases/db_auth_signout_uc.dart';
//cubit/bloc
export 'package:ca_firebase2_app/features/authentication/presentation/cubit/authentication_cubit.dart';
export 'package:ca_firebase2_app/features/authentication/presentation/bloc/authentication_bloc.dart';

//!Dear Programmer Todo: https://youtu.be/MMo3gghipN4

//data

//domain

//presentation

