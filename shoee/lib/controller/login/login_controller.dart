import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/controller/auth_provider.dart';
import 'package:shoee/controller/dashboard_controller.dart';
import 'package:shoee/controller/login/login_state.dart';
import 'package:shoee/route/go_router_notifer.dart';

class LoginController extends StateNotifier<LoginState>{
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).loginwithEmailandPassword(
        email,
        password,
      );
      
      ref.read(goRouterNotifierProvider).isLoggedIn = true;
      ref.read(goRouterNotifierProvider).isError = false;
      ref.read(goRouterNotifierProvider).isSignup = false;
      ref.read(dashboardControllerProvider.notifier).setPosition(0);
      state = const LoginStateSuccess();
    } 
    catch (e) {
      ref.read(goRouterNotifierProvider).isError = true;
      state = LoginStateError(e.toString());
    }
  }

  void getOut() async {
    await ref.read(authRepositoryProvider).signOut();
    ref.read(goRouterNotifierProvider).isLoggedIn = false;
    state = LoginStateOut();
  }

  void signup(String email, String password, String nama) async {
    try {
      ref.read(authRepositoryProvider).signUp(
        email, password, nama);
      state = MsgPush("Silakan Login");
      
    } catch (e){
      print(e.toString());
    }
  }


}

final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});

final loginStateProvider = Provider<LoginState>((ref) {
  return ref.watch(loginControllerProvider.notifier).state;
});