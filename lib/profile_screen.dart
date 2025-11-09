import 'package:flutter/material.dart';
import 'package:instagram_mockup/profilegrid.dart';
import'package:instagram_mockup/stories.dart';
import'package:instagram_mockup/highlights.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget{
   Profile({super.key});
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final gridImages = <String>[
      "assets/images/one.png","assets/images/two.png","assets/images/three.png",
      "assets/images/four.png","assets/images/five.png","assets/images/six.png",
      "assets/images/seven.png","assets/images/one.png","assets/images/two.png",
    ];
    final highlights=<StoriesAvatar>[
      StoriesAvatar(username: "New", avatarUrl: "" ),
      StoriesAvatar(username: "Friends", avatarUrl: "assets/images/friends.png"),
      StoriesAvatar(username: "Sports",avatarUrl: "assets/images/sport.png"),
      StoriesAvatar(username: "designs", avatarUrl: "assets/images/design.png")

    ];

    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(


              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.lock)),
                    Text("jacob_l"),
                    IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_sharp))

                  ],
                ),
              ),
        centerTitle: true,

        actions: [IconButton(onPressed: ()=> _scaffoldKey.currentState!.openEndDrawer(), icon: Icon(Icons.menu))]


      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child:Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: Image.asset("assets/images/jacob.png").image,

                ),
                SizedBox(width: 20,),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Column(
                       children: [
                         Text("54",style: TextStyle(fontWeight: FontWeight.bold)),
                         Text("Posts")

                       ]
                     ),
                     Column(
                        children: [
                          Text("834",style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Followers")


                        ],
                     ),
                     Column(
                       children: [
                         Text("162",style: TextStyle(fontWeight: FontWeight.bold)),
                         Text("Following")

                       ]
                     )
                    
                   ],
                ))
              ]
          )

    ),
Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
child: Align(
  alignment: Alignment.centerLeft,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      Text("jacob west", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

  RichText(
  text: TextSpan(
  children: [
    TextSpan(
    text: "digital goods designer ",
    style: TextStyle(color: Colors.black), // normal text
  ),
    TextSpan(
      text: "@pksellz",
      style: TextStyle(
        color: Colors.blue, // 👈 only @pksellz is blue
        fontWeight: FontWeight.bold,
      ),
    ),
],),
),
      Text("everything is designed", style: TextStyle(color: Colors.black),),


    ]
  )
)
),
  Padding(padding: EdgeInsets.symmetric(horizontal: 16),
  child: SizedBox(width: double.infinity,
    child: OutlinedButton(
      onPressed: (){},
    child: Text("Edit Profile", style: TextStyle(color: Colors.black)),

    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.white),


    )),

  ),

  ),
         SizedBox(height:12),
         SizedBox(height: 120,
           child: HighLights(highlights: highlights),),
Padding(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child:Container(
    decoration: BoxDecoration(
      border:Border (top:BorderSide(color:Colors.grey)),

    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/gridicon.svg", width: 24, height: 24,colorFilter: const ColorFilter.mode(Colors.black,BlendMode.srcIn),),),

      IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/tagsicon.svg", width: 24, height: 24,colorFilter: const ColorFilter.mode(Colors.black,BlendMode.srcIn),),),
    ],

  ),
  )
),








          ProfileGrid(imageAssets: gridImages),


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
        BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/reel.svg", width: 24, height: 24,colorFilter: const ColorFilter.mode(Colors.black,BlendMode.srcIn),),label:''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label:''),
        BottomNavigationBarItem(icon: Icon (Icons.account_circle_rounded),label:''),

      ],
      ),
      endDrawer: Drawer(
      width: 300,
        child: SafeArea(
          child: Column(
            children:[Expanded(child: ListView(

                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                children: [
                  ListTile(

                    title: Text("s.khasanov_"),


                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text("Archive"),
                    onTap: (){},

                  ),
                  ListTile(
                    leading: Icon(Icons.av_timer_rounded),
                    title: Text("Your Activity"),
                    onTap: (){},

                  ),
                  ListTile(
                    leading: Icon(Icons.qr_code_scanner_rounded),
                    title: Text("Nametag"),
                    onTap: (){},

                  ),
                  ListTile(
                    leading: Icon(Icons.bookmark_border),
                    title: Text("Saved"),
                    onTap: (){},

                  ),
                  ListTile(
                    leading: Icon(Icons.list_rounded),
                    title: Text("Close Friend"),
                    onTap: (){},

                  ),
                  ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text("Discover People"),
                    onTap: (){},

                  ),
                  ListTile(
                    leading: Icon(Icons.facebook),
                    title: Text("Open Facebook"),
                    onTap: (){},

                  ),
                  ],
            ),),
                  Divider(),

                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    onTap: (){},),


              ]
              ),

          )

        )


    );
  }
}