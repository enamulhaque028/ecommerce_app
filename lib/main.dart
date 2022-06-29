import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_app/core/network/http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'core/helper/app_bloc_observer.dart';
import 'data/repositories/product_category_repository.dart';
import 'screens/home/home_page.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    BlocOverrides.runZoned(
      () async {
        setup();
        runApp(const MyApp());
      },
      blocObserver: AppBlocObserver(),
    );
  }, (error, stackTrace) async {
    log('runzoned error');
    log(error.runtimeType.toString());
    log(error.toString(), stackTrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductCategoryRepository(
            baseClient: sl.get<BaseHttpClient>(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
