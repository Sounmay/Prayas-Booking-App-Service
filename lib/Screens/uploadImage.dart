import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Providers/FirebaseApi.dart';
import 'package:freelance_booking_app_service/Providers/database.dart';
import 'package:path/path.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  UploadTask task;
  File file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[400]),
                      height: 220,
                      width: 220,
                      child: file != null
                          ? Image.file(
                              File(file.path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : null,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: selectFile,
                          child: Text('Select Image',
                              style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xff5D5FEF))),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: uploadFile,
                        child: Text('Upload Image',
                            style: TextStyle(color: Colors.white)),
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff5D5FEF)),
                      ),
                    ],
                  ),
                  task != null ? buildUploadStatus(task) : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);
            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, color: Colors.black),
            );
          } else {
            return Container();
          }
        },
      );
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    final path = result.files.single.path;
    setState(() => file = new File(path));
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file.path);
    final destination = 'userImage/$fileName';

    task = FirebaseApi.uploadFile(destination, file);

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    DatabaseService().uploadImage(urlDownload);
  }
}
