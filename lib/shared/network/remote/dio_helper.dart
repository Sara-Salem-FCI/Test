import 'package:dio/dio.dart';
//https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=e1a00d07c8aa4328affc11faa3c772b6
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=e1a00d07c8aa4328affc11faa3c772b6
class DioHelper {
   static Dio? dio;
   static init(){
     dio = Dio(
       BaseOptions(
         baseUrl: 'https://newsapi.org/',
         receiveDataWhenStatusError: true,
       ),
     );
   }

   static Future<Response?> getData ({
     required url,
     required Map<String , dynamic> query,
}) async
   {
   return await  dio?.get(url , queryParameters: query,);
   }
}