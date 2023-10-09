import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:iratus/app.dart';
import 'package:iratus/cubits/preferences_cubit.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(
    BlocProvider(
        create: (context) => PreferencesCubit(), child: const IratusApp()),
  );
}
