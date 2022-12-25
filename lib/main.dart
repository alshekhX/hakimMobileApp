import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakim/screens/CategoryScreen.dart';
import 'package:hakim/screens/homePage.dart';
import 'package:hakim/screens/providers/HomeCareProvider.dart';
import 'package:hakim/screens/providers/doctorsProvider.dart';
import 'package:hakim/screens/providers/hospitalProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() {
  runApp(MultiProvider(providers:  [
    ChangeNotifierProvider(create: (context) => DoctorsProvider()),
    ChangeNotifierProvider(create: (context) => HomeCareProvider()),
    ChangeNotifierProvider(create: (context) => HospitalProvider()),
    // ChangeNotifierProvider(
    //   create: (context) => AuthProvider(),
    // ),
  ],
  child:const MyApp(),)
    
    
    
    
    
    
    
    
     );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
         localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ar'),
        
        
        theme: ThemeData(
          
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Color(0xffFCFCFC),
          backgroundColor:Color(0xffFCFCFC),
          
          textTheme: GoogleFonts.tajawalTextTheme(),
         
          canvasColor: Colors.white,scaffoldBackgroundColor: Colors.white
        ),
        home:  MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const Scaffold(
      
        body: HomePage());
  }
}
