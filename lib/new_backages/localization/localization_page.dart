import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/new_backages/localization/localization_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    print('init State');
    super.initState();
  }
  Future<void> changeLanguage(String lang)async{
    await context.setLocale(Locale(lang));
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LocalizationBody(),
          ElevatedButton(
              onPressed: () async{

                changeLanguage('ar');
                  setState(() {

                });
              },
              child: Text('العربيه'),

            ),
            ElevatedButton(
              onPressed: ()async {
                changeLanguage('en').then((value) async{
                  setState(() {

                  });
                });

              },
              child: Text('english'),

            ),
          ],
        ),
      ),
    );
  }
}

