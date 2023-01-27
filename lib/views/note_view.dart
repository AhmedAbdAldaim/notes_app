import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomNoteItem(),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}