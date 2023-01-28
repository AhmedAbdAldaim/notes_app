import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController des = TextEditingController();
  AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            Navigator.of(context).pop();
          }
          if (state is AddNoteFailure) {
            print(state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading? true:false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: title,
                        hint: 'title',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'empty';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: des,
                        hint: 'description',
                        maxLines: 3,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'empty';
                          }
                        },
                      ),
                      CustomBottom(
                        title: 'add',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {}
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
