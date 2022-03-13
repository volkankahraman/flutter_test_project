import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/blocs/bloc/post_bloc.dart';
import 'package:flutter_test_project/components/notched_bottom_bar.dart';

class AddPostForm extends StatefulWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  State<AddPostForm> createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String body = "";

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      context.read<PostBloc>().add(PostAdded(title, body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      bloc: context.read<PostBloc>(),
      listener: (context, state) {
        print('state changed');
        if (state is PostAdded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Yay! Post added'),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Post"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Post Title',
                  ),
                  validator: (value) {
                    return value != null && value.isEmpty
                        ? 'Please enter post name'
                        : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Post Body',
                  ),
                  validator: (value) {
                    return value != null && value.isEmpty
                        ? 'Please enter post body'
                        : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      body = value;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFCE20FA),
                    // minimumSize: const Size.fromHeight(50),
                    minimumSize: const Size(double.infinity, 32.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: _submit,
                  child: const Text('Publish'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFBDBDBD),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const NotchedBottomAppBar(),
      ),
    );
  }
}
