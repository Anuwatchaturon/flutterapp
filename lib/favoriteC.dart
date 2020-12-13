import 'package:flutter/material.dart';
class ParentMangeC extends StatefulWidget {
  @override
  _ParentMangeCState createState() => _ParentMangeCState();
}
class _ParentMangeCState extends State<ParentMangeC> {

  int _favoriteCount = 41;
  
   void _handleTapboxChanged(bool newValue) {
  setState(() {
    if (newValue) {
      _favoriteCount += 3;

    } else {
      _favoriteCount -= 3;

    }
  });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FavoriteC(
        onChanged: _handleTapboxChanged,
        favoriteCount: _favoriteCount,
      ),
    );
  }
}

class FavoriteC extends StatefulWidget {
  FavoriteC({Key key,  @required this.onChanged, this.favoriteCount})
      : super(key: key);

  final ValueChanged<bool> onChanged;
  final int favoriteCount;

 @override
  _FavoriteCState createState() => _FavoriteCState();
}

class _FavoriteCState extends State<FavoriteC> {
  bool isFavorited = true;

  get favoriteCount => widget.favoriteCount;

  void _handleTap() {
    setState(() {
      widget.onChanged(!isFavorited);
      isFavorited = !isFavorited;
    });
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            alignment: Alignment.centerRight,
            icon: (isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _handleTap,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$favoriteCount'),
          ),
        ),
      ],
    );
  }
}
