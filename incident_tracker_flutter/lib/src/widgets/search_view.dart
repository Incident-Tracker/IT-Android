import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 6, 16, 24),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "검색어를 입력하세요",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NotoSansCJKkr",
                    fontSize: 15,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).accentColor,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}