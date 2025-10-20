import 'package:flutter/material.dart';

class ProfileGrid extends StatelessWidget{
  final List<String> imageAssets;
  const ProfileGrid({super.key, required this.imageAssets});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: imageAssets.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
    ),
        itemBuilder: (BuildContext context, int i)=> AspectRatio(
        aspectRatio: 1,
        child: Image.asset(imageAssets[i], fit: BoxFit.cover),


        ),
    );


}}