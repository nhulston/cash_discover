import 'package:cash_discover/components/navigation_icon.dart';
import 'package:cash_discover/components/style.dart';
import 'package:cash_discover/my_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Style.background,
      ),
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
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('test'),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  // TODO replace with official CashApp icons
                  NavigationIcon(icon: CupertinoIcons.home, isPrimary: false),
                  NavigationIcon(icon: CupertinoIcons.creditcard, isPrimary: false),
                  NavigationIcon(icon: CupertinoIcons.money_dollar, isPrimary: true),
                  NavigationIcon(icon: CupertinoIcons.chart_bar, isPrimary: false),
                  NavigationIcon(icon: CupertinoIcons.bitcoin, isPrimary: false),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
