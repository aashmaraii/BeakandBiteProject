import 'package:beakandbite/common/bottom_bar.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/admin/screens/admin_screen.dart';
import 'package:beakandbite/features/auth/screens/auth_screens.dart';
import 'package:beakandbite/features/auth/services/auth_service.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:beakandbite/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider(),),
  ],
    child: const MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final Authservice authservice = Authservice();
  @override
  void initState() {
   
    super.initState();
    authservice.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary:GlobalVariables.secondaryColor), 
      ),
      onGenerateRoute: (settings)=>generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty? 
      Provider.of<UserProvider>(context).user.type =='user'? const BottomBar():const AdminScreen():const AuthScreen(),
    );
  }
}


