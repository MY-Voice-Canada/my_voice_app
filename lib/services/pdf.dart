// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

// Future<Uint8List> fetchPdfContent(final String url) async {
//   try {
//     final Response<List<int>> response = await Dio().get<List<int>>(
//       url,
//       options: Options(responseType: ResponseType.bytes),
//     );
//     return Uint8List.fromList(response.data!);
//   } catch (e) {
//     return Future.error(e);
//   }
// }
