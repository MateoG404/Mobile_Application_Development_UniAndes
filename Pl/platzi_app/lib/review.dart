import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String path_image;
  final String username;
  final String detailsUser;
  final String comment;

  Review(this.path_image, this.username, this.detailsUser, this.comment,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoUser = Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(path_image),
        ),
      ),
    );

    final userDetails = Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          Text(
            detailsUser,
            style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 10,
            ),
          ),
          Text(
            comment,
            style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [photoUser, userDetails],
    );
  }
}
