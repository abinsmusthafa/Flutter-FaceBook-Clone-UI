
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbsm/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  final String imgUrl;
  final bool isActive;
  final bool isNeedBorder;

  const ProfileAvatar({Key key,@required this.imgUrl, this.isActive = false,this.isNeedBorder = false}) : super(key: key);

  @override
  ProfileAvatarState createState() => ProfileAvatarState();
}

class ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return      Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: widget.isNeedBorder ? 18.0 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(widget.imgUrl),
          ),
        ),
      widget.isActive ?  Positioned(
            bottom: 2.0,
            right: 4.0,
            child: Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                  color: Palette.online,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: 2)
              ),
            )): SizedBox.shrink()
      ],
    );
  }
}
