import 'package:flutter/material.dart';
class ParentMangeB extends StatefulWidget {
  @override
  _ParentMangeBState createState() => _ParentMangeBState();
}
class _ParentMangeBState extends State<ParentMangeB> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  
   void _handleTapboxChanged(bool newValue) {
  setState(() {
    _isFavorited = newValue;
    if (_isFavorited) {
      _favoriteCount += 2;

    } else {
      _favoriteCount -= 2;

    }
  });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FavoriteB(
        isFavorited: _isFavorited,
        onChanged: _handleTapboxChanged,
        favoriteCount: _favoriteCount,
      ),
    );
  }
}

class FavoriteB extends StatelessWidget {
  FavoriteB({Key key, this.isFavorited: false, @required this.onChanged, this.favoriteCount})
      : super(key: key);

  final bool isFavorited;
  final ValueChanged<bool> onChanged;
  final int favoriteCount;

  void _handleTap() {
    onChanged(!isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
