import 'package:flutter/material.dart';

class userProductWidget extends StatelessWidget {
  final String Img, Title, Subtitle;

  userProductWidget({
    this.Img,
    this.Title,
    this.Subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return ListTile(
            leading: Container(width: 70, child: Image.network(Img)),
            title: Text(
              Title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
              Subtitle,
              style: Theme.of(context).textTheme.headline,
            ),
            trailing: Container(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      size: 22,

                    ),
                    Icon(
                      Icons.delete,
                      size: 22,
                      color: Colors.red,
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
