import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbsm/config/palette.dart';
import 'package:fbsm/data/data.dart';
import 'package:fbsm/models/models.dart';
import 'package:fbsm/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatefulWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _PostHeader(post : widget.post),
SizedBox(height: 8,),
                Text(widget.post.caption),
                widget.post.imageUrl != null ? SizedBox.shrink() : SizedBox(height: 8,),
              ],
            ),
          ),
          widget.post.imageUrl != null ? Padding(
            padding: const EdgeInsets.symmetric(vertical : 8.0),
            child: CachedNetworkImage(imageUrl: widget.post.imageUrl),
          ) : SizedBox.shrink(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post : widget.post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatefulWidget {
  final Post post ;

  const _PostHeader({Key key, @required this.post}) : super(key: key);

  @override
  __PostHeaderState createState() => __PostHeaderState();
}

class __PostHeaderState extends State<_PostHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfileAvatar(imgUrl: widget.post.user.imageUrl,),
        SizedBox(width: 8,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.post.user.name,style: TextStyle(fontWeight: FontWeight.w600),),
              Row(
                children: <Widget>[
                  Text(widget.post.timeAgo),
                 Icon(Icons.public,color: Colors.grey[600],size: 12,),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.more_horiz,),
        )
      ],
    );
  }
}

class _PostStats extends StatefulWidget {
  final Post post;

  const _PostStats({Key key,@required this.post}) : super(key: key);
  @override
  __PostStatsState createState() => __PostStatsState();
}

class __PostStatsState extends State<_PostStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
Container(
  padding:EdgeInsets.all(4),
  decoration: BoxDecoration(
    color: Palette.facebookBlue,
    shape: BoxShape.circle,
  ),
  child: Icon(Icons.thumb_up,color: Colors.white,size: 10,),

),
            SizedBox(width: 4,),
            Expanded(child: Text('${widget.post.likes}',style: TextStyle(color: Colors.grey[600]),)),
            Text('${widget.post.comments} Comments',style: TextStyle(color: Colors.grey[600]),),
            SizedBox(width: 4,),
            Text('${ widget.post.shares} Shares' ,style: TextStyle(color: Colors.grey[600]),)


          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            _PostButton(
              icon : Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label : "Like",
              onTap : (){print("Abins");}
            ),
            _PostButton(
                icon : Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label : "Comment",
                onTap : (){print("Abins");}
            ),
            _PostButton(
                icon : Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label : "Share",
                onTap : (){print("Abins");}
            )
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({Key key, this.icon, this.label, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                SizedBox(width: 4,),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
