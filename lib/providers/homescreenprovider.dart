import 'package:api_with_provider/Models/Post.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenProvider extends ChangeNotifier{
  bool _isProcessing = true;
  List<Post> _postsList = [];

  bool get isProcessing => _isProcessing;

  List<Post> get postsList => _postsList;

  setIsProcessing(bool value){
    _isProcessing = value;
    notifyListeners();
  }

  setPostLists(List<Post> list){
    _postsList = list;
    notifyListeners();
  }

  Post getPostByIndex(int index) => _postsList[index];

  mergePosts(List<Post> list){
    _postsList.addAll(list);
    notifyListeners();
  }
}