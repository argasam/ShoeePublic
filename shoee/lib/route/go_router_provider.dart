import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoee/controller/auth_provider.dart';
import 'package:shoee/controller/login/login_controller.dart';
import 'package:shoee/controller/login/login_state.dart';
import 'package:shoee/model/cart.dart';
import 'package:shoee/model/shoe.dart';
import 'package:shoee/route/go_router_notifer.dart';
import 'package:shoee/view/Custom/add_custom.dart';
import 'package:shoee/view/Custom/choosevendor.dart';
import 'package:shoee/view/Custom/history_custom.dart';
import 'package:shoee/view/Details/details_view.dart';
import 'package:shoee/view/acc_view.dart';
import 'package:shoee/view/auth_view.dart';
import 'package:shoee/view/buy/buy_view.dart';
import 'package:shoee/view/buy/buydata.dart';
import 'package:shoee/view/cart_view.dart';
import 'package:shoee/view/dashboard_view.dart';
import 'package:shoee/view/error/router_error_view.dart';
import 'package:shoee/route/named_route.dart';
import 'package:go_router/go_router.dart';
import 'package:shoee/view/custom_view.dart';
import 'package:shoee/view/home_view.dart';
import 'package:shoee/view/login_view.dart';
import 'package:shoee/view/splash_view.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');


final goRouterProvider = Provider<GoRouter>((ref){
  final notifier = ref.read(goRouterNotifierProvider);
  final router = GoRouterNotifier();
  final _authState = ref.watch(authStateProvider);
  final loginState = ref.watch(loginControllerProvider);
  bool isDuplicate = false;
  return GoRouter(
    navigatorKey: _rootNavigator,
    // initialLocation: '/',
    refreshListenable: notifier,
    redirect: ((context, state) {
      
      
      // final isLoggingIn = state.location == '/login';
      // final loginState = ref.watch(loginStateProvider);
      final isSignup = notifier.isSignup;
      final isError = notifier.isError;
      final isLoggedIn = notifier.isLoggedIn;
      final isGoingToLogin = state.matchedLocation == '/login';

      if (!isLoggedIn && !isGoingToLogin && !isDuplicate && !isSignup) {
        isDuplicate = true;
        return '/login';
      } else if (!isLoggedIn && !isGoingToLogin && !isDuplicate && isSignup){
        isDuplicate =true;
        return '/signup';
      }
      if (isLoggedIn && isGoingToLogin && !isDuplicate && !isSignup)  {
        isDuplicate = true;
        return '/';
      }
      
      if(isDuplicate) {
        isDuplicate = false;
      }

      
      return null;
  
      // if (loginState is LoginStateInitial || loginState is LoginStateOut || loginState is LoginStateError) {
      //   return 
      //   // isLoggingIn ? null : 
      //   '/login';
      // }

      // else if (isLoggingIn) {
      //   return '/';
      // }

      // return null;

      // return _authState.when(
      // data: (user){
      //   if (user != null) return '/';
      //   return '/login';
      // },
      // error: ((error, stackTrace) => '/login'), 
      // loading: (() => '/splash'));
      // if (loginState is LoginStateInitial) {
      //   return isLoggingIn ? null : '/login';
      //   }

      // if (isLoggingIn) return '/';

      
    }
    ),
    
    routes: [
      GoRoute(
        path: '/home',
        name: root,
        builder: (context, state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: '/login',
        name: login,
        builder: (context, state) {
          return LoginView();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/signup',
        name: signup,
        builder: (context, state) {
          return AuthView();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/customdo',
        name: customdo,
        builder: (context, state) {
          return AddCustom();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/buypage',
        name: buypage,
        builder: (context, state) {
        final buyData = ref.read(buyDataProvider);
        final double price = buyData.price;
        final List<CartItem> choosenItems = buyData.choosenItems;
        final List<CartItem> cartList = buyData.cartList;
          return BuyView(choosenItems: choosenItems, totalPrice: price, cartList: cartList);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/choosevendor',
        name: choosevendor,
        builder: (context, state) {
          return ChooseVendor();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: '/customhistory',
        name: customhistory,
        builder: (context, state) {
          return CustomHistory();
        },
      ),
      GoRoute(
        path: '/splash',
        name: splash,
        builder: (context, state) {
          return SplashView();
        },
      ),
      ShellRoute(
        // navigatorKey: _shellNavigator,
        builder: (context, state, child) => DashboardView(key: state.pageKey, child: child),

        routes: [
          GoRoute(
            path: '/',
            name: home,
            // parentNavigatorKey: _shellNavigator,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeView());
            },
          ),
          GoRoute(
            path: '/cart',
            name: cart,
            // parentNavigatorKey: _shellNavigator,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: CartView());
            },
          ),
          GoRoute(
            path: '/custom',
            name: custom,
            // parentNavigatorKey: _shellNavigator,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: CustomView());
            },
          ),
          GoRoute(
            path: '/acc',
            name: acc,
            // parentNavigatorKey: _shellNavigator,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: AccView());
            },
          ),
        ]  
      ),
      GoRoute(
        path: '/details',
        name: details,
        parentNavigatorKey: _rootNavigator,
        pageBuilder: (context, state) {
          Shoe shoe = state.extra as Shoe;
          return NoTransitionPage(
            child: DetailsView(
              shoe: shoe, ref: ref));
        },
      ),
      
      // GoRoute(
            // path: '/acc',
            // name: acc,
            // pageBuilder: (context, state) {
              // return NoTransitionPage(
                // child: AccView());
            // },
      // ),
    ],
    errorBuilder: (context, state) => RouteErrorView(
      errorMsg: state.error.toString(),
      key: state.pageKey,  
    ),
  );
});