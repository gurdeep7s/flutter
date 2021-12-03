

import 'package:demo_app/screens/login/bloc/login_bloc.dart';
import 'package:demo_app/screens/login/repo/login_web_repo.dart';
import 'package:demo_app/screens/signup/bloc/sign_up_block.dart';
import 'package:demo_app/screens/signup/repo/signup_web_repo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setup(){
  locator.registerLazySingleton<LoginBloc>(() => LoginBloc());
  locator.registerLazySingleton<LoginWebRepo>(() => LoginWebRepo());
  locator.registerLazySingleton<SignupBloc>(() => SignupBloc());
  locator.registerLazySingleton<SignupWebRepo>(() => SignupWebRepo());
}