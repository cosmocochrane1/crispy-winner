import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/auth.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import 'package:flutter_complete_guide/screens/forgot_password_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/category_overview_screen.dart';
import './screens/category_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/auth_screen.dart';
import './screens/forgot_password_screen.dart';
import './screens/profile_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';
import './providers/categories.dart';

import './widgets/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        )
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        return MaterialApp(
            title: 'MyShop',
            scaffoldMessengerKey: Utils.messengerKey,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              fontFamily: 'Raleway',
              brightness: Brightness.light,
              primaryColor: Colors.lightBlue[800],
            ),
            home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong!'));
                  } else if (snapshot.hasData) {
                    return CategoryOverviewScreen();
                  } else {
                    return AuthPage();
                  }
                }),
            routes: {
              AuthPage.routeName: (context) => AuthPage(),
              CategoryDetailScreen.routeName: (context) =>
                  CategoryDetailScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              OrdersScreen.routeName: (context) => OrdersScreen(),
              UserProductsScreen.routeName: (context) => UserProductsScreen(),
              ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
              CategoryOverviewScreen.routeName: (context) =>
                  CategoryOverviewScreen()
            });
      }),
    );
  }
}
