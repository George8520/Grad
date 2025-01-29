import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemChrome
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:signup1/screens/about.dart';
import 'package:signup1/screens/connected.dart';
import 'package:signup1/screens/controls.dart';
import 'package:signup1/screens/forgot_password.dart';
import 'package:signup1/screens/helpchat.dart';
import 'package:signup1/screens/notification_screen.dart';
import 'package:signup1/screens/settings.dart';
import 'package:signup1/screens/start_connection.dart';
import 'package:signup1/screens/login.dart';
import 'package:signup1/screens/password_set_successful.dart';
import 'package:signup1/screens/set_new_password.dart';
import 'package:signup1/screens/splash.dart';
import 'package:signup1/screens/welcome.dart';
import 'package:signup1/screens/verification.dart';
import 'package:signup1/screens/instructions.dart';
import 'package:signup1/screens/signup.dart';
import 'package:signup1/widgets/messages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'cubits/control_cubit.dart'; // Import your ControlCubit class
import 'l10n/locale_provider.dart';
//mahmoud
///test m3 george
///kjgjjdhgdhghghgd
void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  SystemChrome.setPreferredOrientations([ // Lock orientation to portrait mode
    DeviceOrientation.portraitUp, // Only allow portrait mode
    DeviceOrientation.portraitDown, // Optional: Allow upside-down portrait mode
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          // Existing LocaleProvider
          ChangeNotifierProvider(
            create: (_) => LocaleProvider(),
          ),
          // Provide ControlCubit
          BlocProvider<ControlCubit>(
            create: (_) => ControlCubit(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: localeProvider.locale, // Dynamically updated locale
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      // Define your routes here
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/controls': (context) => ControlsPage(),
        '/connected': (context) => Connected(),
        '/about': (context) => About(),
        '/settings': (context) => Settings_screen(),
        '/start_connection': (context) => Start_connection(),
        // Add other routes as needed
      },
      // You can set home or use initialRoute
      // home: SplashScreen(), // Not needed if using initialRoute
    );
  }
}