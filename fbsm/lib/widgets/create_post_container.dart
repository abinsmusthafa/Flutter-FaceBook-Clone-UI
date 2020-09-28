
import 'package:fbsm/data/data.dart';

import 'widgets.dart';
import 'package:fbsm/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatefulWidget {
  final User currentUser;

  const CreatePostContainer({Key key,@required this.currentUser}) : super(key: key);
  @override
  _CreatePostContainerState createState() => _CreatePostContainerState();
}

class _CreatePostContainerState extends State<CreatePostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ProfileAvatar(imgUrl: currentUser.imageUrl,isActive: false,),
              const SizedBox(width: 8.0,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: "whats on your mind !"
                  ),
                ),
              )
            ],
          ),
          Divider(
            height: 10.0,
            thickness: .5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(onPressed: (){}, icon: Icon(Icons.videocam,color: Colors.red), label: Text("Live")),
                VerticalDivider(width: 8.0,),
                FlatButton.icon(onPressed: (){}, icon: Icon(Icons.photo_library,color: Colors.green,), label: Text("Photo")),
                VerticalDivider(width: 8.0,),
                FlatButton.icon(onPressed: (){}, icon: Icon(Icons.video_call,color: Colors.purpleAccent,), label: Text("Room")),


              ],
            ),
          )

        ],
      ),
    );
  }
}
