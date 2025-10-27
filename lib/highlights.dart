import 'package:flutter/material.dart';
import 'package:instagram_mockup/stories.dart';

class HighLights extends StatelessWidget{
  final List <StoriesAvatar> highlights;
  const HighLights({super.key,required this.highlights});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: highlights.map((h){
            final avatar =h.avatarUrl.isEmpty?const CircleAvatar(radius: 40, backgroundColor: Colors.white,
            child: Icon(Icons.add, size: 20, color: Colors.black,))
                : CircleAvatar(radius: 40, backgroundImage: AssetImage(h.avatarUrl));
            return Padding( padding: const EdgeInsets.only(right:16),
            child: Column(
              children: [
                avatar,
            const SizedBox(height:6),
            Text(h.username, ),
            ]
            ),
            );
          }

        ).toList(),
      )
      )
    );
  }

}