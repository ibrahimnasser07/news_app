import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class Article extends StatelessWidget {
  const Article({
    Key? key,
    required this.image,
    required this.url,
    required this.title,
    required this.date,
  }) : super(key: key);
  final String image, url, title, date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: myImage(image),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}

Widget myImage(image) {
  try {
    return Image.network(
      image,
      height: 120,
      width: 120,
      fit: BoxFit.cover,
    );
  } catch (e) {
    return Image.network(
      noImagePlaceholder,
      height: 120,
      width: 120,
      fit: BoxFit.cover,
    );
  }
}
