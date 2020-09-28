import 'package:fbsm/config/palette.dart';
import 'package:fbsm/models/models.dart';
import 'package:fbsm/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatefulWidget {
  final List<User> onlineUsers ;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + widget.onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _createRoomButton();
            }
            final user = widget.onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(imgUrl: user.imageUrl, isActive: true,),
            );
          }),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(onPressed: (){},

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),color: Colors.white,
      borderSide: BorderSide(width: 3,color: Colors.blueAccent[100]),
      child: Row(children: <Widget>[
        ShaderMask(
          shaderCallback: (rect) =>
            Palette.createRoomGradient.createShader(rect),
                  child: Icon(
            Icons.video_call,
            size: 35,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 4,),
        Text("Create\n Room")
      ],),
    );
  }
}
