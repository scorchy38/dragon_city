import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/localization/localization.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/screens/explore_screen.dart';

import 'package:flutterdragoncity/screens/tab_screen.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/select_lang_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {


  static void setLocale(BuildContext context,Locale locale)
  {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale)
  {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    getLocale().then((value) {
      setState(() {
        _locale = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context,constraints)
      {
        return  OrientationBuilder(
            builder: (context,orientation) {
              SizeConfig().init(constraints, orientation,context);
              return StreamBuilder<User>(
                stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context,snapshot)
                {
                      User user;
                      if(snapshot.hasData)
                        user = snapshot.data;
                      return ChangeNotifierProvider.value(
                        value: AuthServices(),
                        child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: 'Dragon City',
                          theme: ThemeData(
                            primarySwatch: Colors.red,
                            visualDensity: VisualDensity.adaptivePlatformDensity,
                          ),
                          locale: _locale,
                          localizationsDelegates: [
                            DemoLocalizations.delegate,
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                          supportedLocales: [
                            Locale('en','US'),
                            Locale('ar','BH')
                          ],
                          localeResolutionCallback: (deviceLocale,supportedLocale)
                          {
                            for(var locale in supportedLocale) {
                              if (locale.languageCode ==
                                  deviceLocale.languageCode &&
                                  locale.countryCode ==
                                      deviceLocale.countryCode)
                                return deviceLocale;
                            }

                            return supportedLocale.first;
                          },
                         home: user == null ? LanguageSelectorPage() : TabScreen(),
                          //home: ExploreScreen(),
                          routes: {
                            TabScreen.routename: (ctx) => TabScreen(),
                          },
                        ),
                      );
                },
              );
            }
        );
      }
    );
  }
}
