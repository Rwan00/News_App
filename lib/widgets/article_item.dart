import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final dynamic article;
  const ArticleItem(this.article,{super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(
                image: NetworkImage(
                  "${article["urlToImage"]}",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
           Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article["title"]}",
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${article["publishedAt"]}",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
