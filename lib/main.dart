import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cash_discover/components/navigation_icon.dart';
import 'package:cash_discover/style/style.dart';
import 'package:cash_discover/pages/coupons_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Style.background,
          textTheme:
              CupertinoTextThemeData(textStyle: TextStyle(fontFamily: 'ARS'))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    // TODO replace with official CashApp icons
                    const SizedBox(width: 7),
                    const NavigationIcon(
                        icon: CupertinoIcons.qrcode_viewfinder, callback: null),
                    const NavigationIcon(
                        icon: CupertinoIcons.search, callback: null),
                    NavigationIcon(
                        icon: CupertinoIcons
                            .tickets, // TODO better icon for coupon
                        callback: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => const CouponsPage()),
                          );
                        }),
                    const Spacer(),
                    const NavigationIcon(
                        icon: CupertinoIcons.clock, callback: null),
                    const NavigationIcon(
                        icon: CupertinoIcons.profile_circled, callback: null),
                    const SizedBox(width: 7),
                  ],
                ),
                const Spacer(),
                Image.asset('assets/images/amount.jpg'),
                const Spacer(),
                Image.asset('assets/images/pay.jpg'),
                const SizedBox(height: 30),
                Image.asset('assets/images/navbar.jpg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
