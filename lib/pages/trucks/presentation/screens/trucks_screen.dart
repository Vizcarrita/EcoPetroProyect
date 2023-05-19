import 'package:flutter/material.dart';
import 'dart:io';
import '../../../shared/widgets/side_menu.dart';
import 'package:image_picker/image_picker.dart';

class ImagesVerify extends StatefulWidget {
  const ImagesVerify({super.key});

  @override
  State<ImagesVerify> createState() => _ImagesVerifyState();
}

class _ImagesVerifyState extends State<ImagesVerify> {
  late File file;
  final picker = ImagePicker();

  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text('Trucks'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: GridView.builder(
        itemCount: images.length + 1,
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return index == images.length
              ? images.length == 3
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: addImage,
                      child: Card(
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
              : Card(
                  child: Image.file(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
        },
      ),
    );
  }

  Future<void> addImage() async {
    if (images.length == 3) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ya tiene el total de imagenes requeridas'),
              ],
            ),
          );
        },
      );
    } else {
      final imagePicker = await picker.pickImage(source: ImageSource.camera);

      if (imagePicker == null) {
      } else {
        file = File(imagePicker.path);
        setState(() {
          images.add(file);
        });
      }
    }
  }
}
