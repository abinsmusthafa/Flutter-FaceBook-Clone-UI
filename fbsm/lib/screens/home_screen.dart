import 'package:fbsm/config/palette.dart';
import 'package:fbsm/data/data.dart';
import 'package:fbsm/models/post_model.dart';
import 'package:fbsm/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("YOYOY");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      centerTitle: false,
      floating: true,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: Text("Facebook",style: TextStyle(
        color:Palette.facebookBlue,
        letterSpacing: -1.2,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),),
      actions: <Widget>[
        CircleButton(icon: Icons.search,iconSize: 28,onPressed:(){ print("Abins");},),
        CircleButton(icon: MdiIcons.facebookMessenger,iconSize: 28,onPressed:(){ print("Abins");},),
      ],
    ),
    SliverToBoxAdapter(
      child: CreatePostContainer(currentUser: currentUser,)
    ),
SliverPadding(
  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
  sliver:   SliverToBoxAdapter(
    child: Rooms(onlineUsers : onlineUsers),
  ),

),
    SliverPadding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
      sliver: SliverToBoxAdapter(
        child: Stories(currentUser: currentUser,stories: stories,),
      ),
    ),
    SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      final Post post = posts[index];
      return PostContainer(post: post);
    },
        childCount: posts.length
    ),
    )
  ],
),
    );
  }
}
