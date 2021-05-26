import 'package:api_with_provider/Helpers/ApiHepler.dart';
import 'package:api_with_provider/Models/Post.dart';
import 'package:api_with_provider/providers/homescreenprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  _showSnackbar(String message, {Color bgColor}){
    _globalKey.currentState.showSnackBar(SnackBar(content: Text(message),backgroundColor: bgColor ?? Colors.red,));
  }

  _hideSnackbar(){
    _globalKey.currentState.hideCurrentSnackBar();
  }

  _getPosts() async{
    var provider = Provider.of<HomeScreenProvider>(context,listen: false);
    var response = await ApiHelper.getPosts();
    if(response.isSuccessful){
      provider.setPostLists(response.data);
    }
    else{
      _showSnackbar(response.message);
    }
    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider with REST API'),
        elevation: 0,
      ),
      body: Consumer<HomeScreenProvider>(builder: (_, provider, __) => provider.isProcessing ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: provider.postsList.length,
        itemBuilder: (context, index){
          Post post = provider.getPostByIndex(index);
          return Column(
            children: [
              ListTile(
                title: Text(post.title),
                subtitle: Text(post.body,maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),
              Divider(color: Colors.black,)
            ],
          );
        },
      ),),
    );
  }
}
