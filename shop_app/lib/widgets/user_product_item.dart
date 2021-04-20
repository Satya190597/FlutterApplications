import 'package:flutter/material.dart';


class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.deepOrange,

      title: Text(this.title,style: TextStyle(color: Colors.white),),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Wrap(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit,color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete,color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
