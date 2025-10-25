

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Postcard extends StatelessWidget {
  final String username;
  final String avatarAsset;
  final String mediaAsset;
  final String caption;
  final String dateText;
  final String? location;   // optional
  final String? likesText;  // optional
  final bool isLiked;
  final int? pageCount;     // optional
  final int? pageIndex;     // optional

  const Postcard({
    super.key,
    required this.username,
    required this.avatarAsset,
    required this.mediaAsset,
    required this.caption,
    required this.dateText,
    this.location,
    this.likesText,
    this.isLiked = false,
    this.pageCount,
    this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
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
                  backgroundImage: AssetImage(avatarAsset),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children:[

                    Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width:6),
                    InkWell(
                      onTap: () {
                        // Handle location tap
                      },

                      child:
                        SvgPicture.asset("images/shape.svg", width: 18, height: 18,
                          colorFilter: const ColorFilter.mode(Colors.blue,BlendMode.srcIn),
                        ),
                        ),
                      ],
                    ),
                    if (location != null)
                      Text(location!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
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
                  child: Image.asset(mediaAsset, fit: BoxFit.cover),
                ),
                if (pageIndex != null && pageCount != null)
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
                        "${pageIndex! + 1}/$pageCount",
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
                icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                color: isLiked ? Colors.red : null,
                onPressed: () {},
              ),
              IconButton(icon: SvgPicture.asset("images/comment.svg", width: 22, height: 22,colorFilter: const ColorFilter.mode(Colors.grey,BlendMode.srcIn)), onPressed: () {}),
              IconButton(icon: const Icon(Icons.send), onPressed: () {}),
              const Spacer(
                flex: 1,
              ),
              if (pageCount != null)
              IconButton(icon:SvgPicture.asset("images/pagination.svg", width: 15, height: 15,colorFilter: const ColorFilter.mode(Colors.grey,BlendMode.srcIn)),onPressed: (){}),
              const Spacer(
                flex: 2,
              ),
              IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
            ],
          ),

          // LIKES (optional)
          if (likesText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 10),
                  const SizedBox(width: 8),
                  Flexible(child: Text(likesText!)),
                ],
              ),
            ),

          const SizedBox(height: 6),

          // CAPTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    caption,
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          // DATE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(dateText),
          ),

          const SizedBox(height: 8),
          const Divider(thickness: 0.5, color: Colors.grey),
        ],
      ),
    );
  }
}
