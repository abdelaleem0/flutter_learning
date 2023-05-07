import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/example_page.dart';
import 'package:learning_flutter/bloc/life_cycle_bloc/life_cycle_cubit.dart';
import 'package:learning_flutter/bloc/life_cycle_bloc/life_cycle_page.dart';
import 'package:learning_flutter/flutter/flutter_compiler.dart';
import 'package:learning_flutter/flutter_widgets/did_update_widget_method.dart';
import 'package:learning_flutter/flutter_widgets/listView_vs_listview_builder.dart';
import 'package:learning_flutter/new_backage/localization/localization_page.dart';
import 'package:learning_flutter/oop/binding.dart';
import 'package:learning_flutter/oop/copy_constructor/copy_constructor_page.dart';
import 'package:learning_flutter/oop/named_constructor/async_page.dart';
import 'package:learning_flutter/state_full_life_cycle/life_cycle_page.dart';

import 'type_of_function/type_of_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  // runApp(
  //   EasyLocalization(
  //     supportedLocales: [const Locale('en'), const Locale('ar')],
  //     fallbackLocale: const Locale('en'),
  //     path: 'assets/translations',
  //     child: const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LifeCycleCubit(),)
      ],
      child: MaterialApp(
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AsyncPage(),
      ),
    );
  }
}
