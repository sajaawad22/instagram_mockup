

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Postcard extends StatefulWidget {
  final String username;
  final String avatarAsset;

  final String caption;
  final String dateText;
  final String? location;
  final String? likesText;
  final bool isLiked;


  final List<String> images;

  const Postcard({
    super.key,
    required this.username,
    required this.avatarAsset,

    required this.caption,
    required this.dateText,
    this.location,
    this.likesText,
    this.isLiked = false,

    required this.images,
  });
  @override
  State<Postcard> createState() => _PostcardState();
}

class _PostcardState extends State<Postcard> {
int currentPage=0;
bool _isLiked = false;

void initState(){
  super.initState();
  _isLiked=widget.isLiked;
}


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER (avatar + name + optional location + menu)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(widget.avatarAsset),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children:[

                    Text(widget.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width:6),
                    InkWell(
                      onTap: () {
                        // Handle location tap
                      },

                      child:
                        SvgPicture.asset("assets/icons/shape.svg", width: 18, height: 18,
                          colorFilter: const ColorFilter.mode(Colors.blue,BlendMode.srcIn),
                        ),
                        ),
                      ],
                    ),
                    if (widget.location != null)
                      Text(widget.location!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
              ],
            ),
          ),

          // MEDIA (stack with optional page badge)
          AspectRatio(
            aspectRatio: 3 / 4,
            child: Stack(
              children: [
                Positioned.fill(
                  child:PageView.builder(
                    itemCount:widget.images.length,
                    onPageChanged: (index){
                      setState(() => currentPage = index);
                      },

                    itemBuilder: (context,index){
                      return Image.asset(
                      widget.images[index],
                        fit: BoxFit.cover,);
                  },

                  ), ),
                if (widget.images.length > 1)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${currentPage + 1}/${widget.images.length}",
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // ACTIONS
          Row(
            children: [
              IconButton(
                icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border, ),
                color: _isLiked ? Colors.red : null,
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                },
              ),
              IconButton(icon: SvgPicture.asset("assets/icons/comment.svg", width: 22, height: 22,colorFilter: const ColorFilter.mode(Colors.grey,BlendMode.srcIn)), onPressed: () {}),
              IconButton(icon:SvgPicture.asset("assets/icons/messanger.svg", width: 22, height: 22,colorFilter: const ColorFilter.mode(Colors.grey,BlendMode.srcIn)), onPressed: () {}),
              const Spacer(
                flex: 1,
              ),
              if (widget.images.length >1)
              IconButton(icon:SvgPicture.asset("assets/icons/pagination.svg", width: 7, height: 7,colorFilter: const ColorFilter.mode(Colors.blue,BlendMode.srcIn)),onPressed: (){}),
              const Spacer(
                flex: 2,
              ),
              IconButton(icon:SvgPicture.asset("assets/icons/save.svg", width: 22, height: 22,colorFilter: const ColorFilter.mode(Colors.grey,BlendMode.srcIn)), onPressed: () {}),
            ],
          ),

          // LIKES (optional)
          if (widget.likesText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 10),
                  const SizedBox(width: 8),
                  Flexible(child: Text(widget.likesText!)),
                ],
              ),
            ),

          const SizedBox(height: 6),

          // CAPTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text.rich(
              TextSpan(
              children: [
                TextSpan(
                text:widget.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan( text:
                  widget.caption,
                    style: const TextStyle(color: Colors.black),
                  ),

              ],
            ),
            ),
              ),

          const SizedBox(height: 4),

          // DATE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(widget.dateText , style: const TextStyle(color: Colors.grey)),
          ),

          //const SizedBox(height: 8),
          //const Divider(thickness: 0.5, color: Colors.grey),
        ],
      ),
    );
  }
}
