
import 'dart:io';
import 'package:flutter_basics/profile_page.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/api/firebase_api.dart';
import 'package:flutter_basics/widget/button_widget.dart';


class updateImage extends StatefulWidget {
  const updateImage({super.key});

  @override
  State<updateImage> createState() => _updateImageState();
}

class _updateImageState extends State<updateImage> {

  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
  
   final fileName = file != null ? basename(file!.path) : 'No Selected File';
   print("file Name : " + fileName);
    
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 26, 24, 24),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ButtonWidget(
                  icon: Icons.attach_file, 
                  text: 'Select File', 
                  onClicked: selectFile,
                ),
                SizedBox(height: 8,),
                Text(
                  fileName,
                  style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 48),
                ButtonWidget(
                  icon: Icons.upload_file_outlined, 
                  text: 'Upload File', 
                  onClicked: uploadFile,
                ),
                SizedBox(height: 20,),
                task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }





    Future selectFile() async {
      final result  = await FilePicker.platform.pickFiles(allowMultiple: false);

      if(result == null) return;

      final path = result.files.single.path!;

      setState(() => file = File(path));
    }




    Future uploadFile() async {
      if(file == null) return;

      final fileName = file!.path;
      final destination = '/images/$fileName';
      task = FirebaseApi.uploadFile(destination,file!);
      setState(() {});

      if(task == null) return;

      final snapshot = await task!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
    }




    Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final percentage = (progress * 100).toStringAsFixed(2);

          return Text(
            '$percentage %',
            style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
          );

        }else{
          return Container();
        }
      },
    );



}