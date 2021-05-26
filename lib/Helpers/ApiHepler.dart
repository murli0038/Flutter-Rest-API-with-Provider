import 'dart:convert';
import 'dart:io';
import 'package:api_with_provider/Models/HttpResponse.dart';
import 'package:api_with_provider/Models/Post.dart';
import 'package:http/http.dart';

class ApiHelper{
  static Future<HTTPResponse<List<Post>>> getPosts({int limit = 20, int pageNumber = 1}) async{
    String url = "https://jsonplaceholder.typicode.com/posts";
    //there are two possible exception 1.Socket and 2. Format exception
    try{
      var response = await get(url);
      if(response.statusCode == 200){
        var body = jsonDecode(response.body);
        List<Post> posts = [];
        body.forEach((e){
          Post post = Post.fromJson(e);
          posts.add(post);
        });
        return HTTPResponse(posts, true,responseCode: response.statusCode, message: "Data Received !!");
      }
      else{
        return HTTPResponse(null, false, message: "Invalid response received from Server !!\n Please try again Later.",responseCode: response.statusCode);
      }
    }
    on SocketException{
      return HTTPResponse(null, false, message: "Unable to reach the internet !!\n Please try again Later.");
    }
    on FormatException{
      return HTTPResponse(null, false, message: "Invalid response received from Server !!\n Please try again Later.");
    }
    catch(e){
      return HTTPResponse(null, false, message: "Something went wrong !!\n Please try again Later.");
    }
  }
}