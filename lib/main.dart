import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product/data/repository/product_repository.dart';
import 'product/bloc/product_bloc.dart';
import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc API',
      builder: (context, child) {
        // Obtain the current media query information.
        final mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
          // Set the default textScaleFactor to 1.0 for
          data: mediaQueryData.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
      /* In building more than one feature where more repositories are required, make use of MultiRepositoryProvider
         where repositories will be provided as a list of providers
         to avoided nested RepositoryProvider.
         This also applies to the case where more than one bloc is being used,
         then make use of MultiBlocProvider containing list blocs
       */
      home: RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepository(),
          child: BlocProvider(
            lazy: false,
            create: (BuildContext context) => ProductBloc(
                productRepository: context.read<ProductRepository>()),
            child: const ProductsPage(),
          )),
    );
  }
}
