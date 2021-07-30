// import 'dart:io';
// // import 'package:path_provider/path_provider.dart' as p;
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:progress_dialog/progress_dialog.dart';

// class Ebook extends StatefulWidget {
//   @override
//   _EbookState createState() => _EbookState();
// }

// class _EbookState extends State<Ebook> {
//   String _fileFullPath;
//   String progress;
//   bool _isLoading = false;
//   final urlPdf =
//       "https://umrahhaji.com/wp-content/uploads/2021/06/EBOOK-INFOGRAFIK-UMRAH-2021.pdf";

//   Dio dio;
//   @override
//   void initState() {
//     dio = Dio();
//     super.initState();
//   }

//   // Future<List<Directory>> _getExternalStoragePath() {
//   //   return p.getExternalStorageDirectories(type: p.StorageDirectory.documents);
//   // }

//   Future _downloadAndSaveFileToStorage(
//       BuildContext context, String urlPath, String fileName) async {
//     ProgressDialog pr;
//     pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
//     pr.style(message: "Downloading file ...");

//     try {
//       //Show dialog
//       await pr.show();

//       var dirList = Directory('/storage/emulated/0/Download');
//       final path = dirList.path;
//       final file = File('$path/$fileName');
//       await dio.download(urlPath, file.path, onReceiveProgress: (rec, total) {
//         setState(() {
//           _isLoading = true;
//           progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
//           print(progress);

//           //update dialog
//           pr.update(message: "Please wait : $progress");
//         });
//       });

//       //hide dialog
//       pr.hide();
//       _fileFullPath = file.path;
//     } catch (e) {
//       print(e);
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("E-Book Percuma"),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image(
//                 image: AssetImage('assets/images/ebook.jpeg'),
//                 width: 400.0,
//                 height: 250.0,
//                 alignment: Alignment.center,
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               ElevatedButton(
//                 child: Text('Muat Turun E-Book'),
//                 onPressed: () {
//                   _downloadAndSaveFileToStorage(
//                       context, urlPdf, "ebookumrahhaji.pdf");
//                 },
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Text("Save at : $_fileFullPath"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
