import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_cubit/add_note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

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
            var cubit = BlocProvider.of<AddNoteCubit>(context);
            return SingleChildScrollView(
              child: Form(
                key: cubit.formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AbsorbPointer(
                    absorbing:state is AddNoteLoading?true:false,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: cubit.title,
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
                          controller: cubit.des,
                          hint: 'description',
                          maxLines: 3,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'empty';
                            }
                          },
                        ),
                        CustomBottom(
                          isLoading: state is AddNoteLoading? true:null,
                          title: 'add',
                          onPressed: () {
                            if (cubit.formkey.currentState!.validate()) {
                              BlocProvider.of<AddNoteCubit>(context).addNote(
                                  NoteModel(
                                      title: cubit.title.text,
                                      description: cubit.des.text,
                                      date: DateTime.now().toString(),
                                      color: Colors.amber.shade100.value));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
