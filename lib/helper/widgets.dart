import 'package:flutter/material.dart';
import 'package:newsapp/views/article_view.dart';

// ignore: non_constant_identifier_names
Widget MyAppBar(){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "         News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        ),
      ],
    ),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search),onPressed: (){})
    ],
    backgroundColor: Colors.amberAccent,
    elevation: 5.0,
  );
}
class Datasearch extends SearchDelegate<ArticleView>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[IconButton(icon: Icon(Icons.clear),onPressed: (){})];
  }
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){},);
  }
  @override
  // ignore: missing_return
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
  }
  @override
  // ignore: missing_return
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
  }

}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
