import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/global_bloc/index.dart';

class AuthGuard extends AutoRouteGuard {
  AuthBloc? authBloc;
  AuthGuard({ this.authBloc });
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    /// Define custom guard logic here
    if(authBloc?.state.authenticated != true){
      resolver.next(false);
    } else {
        resolver.next(true);
    }
  }
}