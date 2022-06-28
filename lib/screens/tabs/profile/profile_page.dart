import 'dart:io';

import 'package:ecommerce_app/widgets/image_picker_dialog.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String updatedImage = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: Stack(
                children: [
                  updatedImage == '' ? const CircleAvatar(
                    backgroundColor: Color(0XFFe6f9ff),
                    radius: 60.0,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/images/upload.png'),
                    ),
                  ) : CircleAvatar(
                    backgroundColor: const Color(0XFFe6f9ff),
                    radius: 60.0,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: FileImage(File(updatedImage)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return ImagePickerDialog(
                              updatePhoto: (imagePath) {
                                setState(() {
                                  updatedImage = imagePath;
                                });
                              },
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        'assets/images/edit.png',
                        fit: BoxFit.cover,
                        height: 30,
                        // width: size.width,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text('MD ENAMUL HAQUE'),
              trailing: Icon(Icons.edit, color: Colors.blue),
            ),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About'),
              subtitle: Text('I’m actually not funny. I’m just really mean and people think I’m joking.'),
              trailing: Icon(Icons.edit, color: Colors.blue),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+880 1843-498350'),
              trailing: Icon(Icons.edit, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
