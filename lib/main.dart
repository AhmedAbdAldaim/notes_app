import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/bloc_observer.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/note_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserve();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NoteCubitCubit()..featchAllNotes())
      ],
      child: MaterialApp(
        title: 'Notes App',
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const NoteView(),
      ),
    );
  }
}
