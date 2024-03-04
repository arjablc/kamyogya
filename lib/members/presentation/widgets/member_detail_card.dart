import 'package:flutter/material.dart';

class MemberDetails extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String club;
  const MemberDetails(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.club});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          child: Image.network(imageUrl),
        ),
        title: Text(
          name,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(club),
      ),
    );
  }
}
