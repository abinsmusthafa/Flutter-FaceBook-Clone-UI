import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbsm/config/palette.dart';
import 'package:fbsm/data/data.dart';
import 'package:fbsm/models/models.dart';
import 'package:fbsm/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, this.currentUser, this.stories}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + widget.stories.length,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _StoryCard(
                  currentUser: currentUser,
                  isAddStory: true,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(story: story),
            );
          },
        ));
  }
}

class _StoryCard extends StatefulWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard({Key key, this.isAddStory = false, this.currentUser, this.story}) : super(key: key);

  @override
  __StoryCardState createState() => __StoryCardState();
}

class __StoryCardState extends State<_StoryCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: widget.isAddStory ? currentUser.imageUrl : widget.story.imageUrl,
            height: double.infinity,
            width: 118,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 118,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
          ),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: widget.isAddStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.add,
                      color: Palette.facebookBlue,
                      size: 30,
                    ),
                  )
                : ProfileAvatar(
                    imgUrl: widget.story.user.imageUrl,
                    isNeedBorder: !widget.story.isViewed,
                  )),
        Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text(
              widget.isAddStory ? "Add to story" : widget.story.user.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
