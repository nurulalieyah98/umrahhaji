// import 'package:dio/dio.dart';
// import 'package:ext_storage/ext_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// final pdfUrl =
//     "https://umrahhaji.com/wp-content/uploads/2021/03/EBOOK-INFOGRAFIK-UMRAH-FEB-2021.pdf";
// var dio = Dio();

// class Ebook extends StatelessWidget {
//   @override
//   void initState() {
//     getPermission();
//   }

//   void getPermission() async {
//     print("getPermission");
//     await PermissionHander().requestPermissions([PermissionGroup.storage]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("E-Book Percuma"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton.icon(
//               onPressed: () async {
//                 String path =
//                     await ExtStorage.getExternalStoragePublicDirectory(
//                         ExtStorage.DIRECTORY_DOWNLOADS);
//                 String fullpath = "$path/EBOOK-INFOGRAFIK-UMRAH-FEB-2021.pdf";
//                 download2(dio, pdfUrl, fullpath);
//               },
//               icon: Icon(Icons.file_download, size: 18),
//               label: Text("Muat Turun"),
//               // style: ElevatedButton.styleFrom(
//               //   primary: Colors.teal,
//               //   onPrimary: Colors.white,
//               //   elevation: 5,
//               // ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
