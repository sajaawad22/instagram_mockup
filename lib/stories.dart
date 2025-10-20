import'package:flutter/material.dart';




class StoriesAvatar extends  StatelessWidget{


  final String username;
  final String avatarUrl;
  final double radius;
  final double fontsize;







  const StoriesAvatar({super.key,required this.username,required this.avatarUrl,this.radius=40,this.fontsize=13});

  @override
  Widget build(BuildContext context) {

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.red, Colors.orange, Colors.purple],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(avatarUrl),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  username,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );

  }
}


