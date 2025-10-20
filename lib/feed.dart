import 'package:flutter/material.dart';
import"package:instagram_mockup/profile.dart";
import'package:instagram_mockup/stories.dart';
import'package:instagram_mockup/postcard.dart';






class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final stories=[
      StoriesAvatar(username: "joshua_l", avatarUrl: "images/joshua.png"),
      StoriesAvatar(username: "craig_love", avatarUrl: "images/story.png"),
      StoriesAvatar(username: "zackjohn",avatarUrl: "images/story1.png"),
      StoriesAvatar(username: "karenne", avatarUrl: "images/story2.png")

    ];
    final poster=<Postcard>[
      Postcard(
        username:"joushua_l",
        location:"Tokyo,japan",
        avatarAsset: "images/joshua.png",
        mediaAsset:"images/feed1.png",
        caption:"the game in japan was amazing and i want to share some photos",
        dateText:"septemper 19",
        likesText:"liked by crag_love and 44,686 others",
        isLiked: true,
        pageCount: 3,
        pageIndex: 0,

      ),
      Postcard(
        username:"joushua_l",
        location:"Tokyo,japan",
        avatarAsset: "images/joshua.png",
        mediaAsset:"images/feed2.png",
        caption:"the game in japan was amazing and i want to share some photos",
        dateText:"septemper 19",
        likesText:"liked by crag_love and 44,686 others",

      )];
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading: Icon(Icons.camera_alt_outlined),
         actions: [
           IconButton(
             icon: Icon(Icons.live_tv),
             color: Colors.black,
             onPressed: () {
               //
             },
           ),
           IconButton(
             icon: Icon(Icons.send),
             color: Colors.black,
             onPressed: () {
               //
             },
           ),
         ],
       ),

      body: SafeArea(
        child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: stories[index],
                )


              )
            ),

            const SizedBox(height:10),
            const Divider(height:1),
            // 1poster(),

            ListView.builder(
              itemCount: poster.length,
              shrinkWrap: true,                           // let it size itself
              physics: const NeverScrollableScrollPhysics(), // disable its scroll
              itemBuilder: (context, index) {
                return poster[index]; // each item is already a PostCard/Postcard widget
              },
            ),






            ],
        ),
      ),
      ),
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index){
          if (index==4){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Profile(),),);
          }
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
     items: [
      BottomNavigationBarItem(icon:Icon (Icons.home),label: ''),
      BottomNavigationBarItem(icon:Icon (Icons.search),label:''),
      BottomNavigationBarItem(icon: Icon(Icons.ondemand_video),label:''),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label:''),
      BottomNavigationBarItem(icon: Icon (Icons.account_circle_rounded),label:''),

          ],),
    );

  }
}

























