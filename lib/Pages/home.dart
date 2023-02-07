import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medium_clone/AuthService.dart';
import 'package:medium_clone/Components/BottomBar.dart';
import 'package:medium_clone/Pages/writing_page.dart';
import '../firebase_crud.dart';
import 'notifications.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _employee_name = TextEditingController();
  final _employee_position = TextEditingController();
  final _employee_contact = TextEditingController();
  TextEditingController TitleController = TextEditingController();
  final _quillController = quill.QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()));
              },
              icon: const Icon(Icons.notifications))
        ],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                AuthService().signOut();
              },
              child: Text("Logout")),
          Image.network(FirebaseAuth.instance!.currentUser!.photoURL!),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            isScrollControlled: true,
            builder: (BuildContext bc) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                    height: 900,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.clear)),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Publish",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20),
                                ))
                          ],
                        ),
                        quill.QuillToolbar.basic(controller: _quillController),
                        Expanded(
                          child: Container(
                            //color: Colors.grey[300],
                            padding: EdgeInsets.all(15),
                            child: quill.QuillEditor.basic(
                                controller: _quillController, readOnly: false),
                          ),
                        ),
                        // TextField(
                        //   style: const TextStyle(
                        //     fontSize: 20,
                        //   ),
                        //   maxLines: null,
                        //   autofocus: true,
                        //   controller: TitleController,
                        //   decoration: const InputDecoration(
                        //     border: InputBorder.none,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.green),
      ),
    );
  }
}

/*

 */
