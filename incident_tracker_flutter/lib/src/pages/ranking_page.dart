import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incident_tracker_flutter/src/controller/post_controller.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  PostController _postController = Get.find();
  int _currentRank = 0;

  Widget _buildRankTabButton(String title, int index) {
    return Builder(
      builder: (context) => Container(
        height: 32,
        color: _currentRank == index
            ? Theme.of(context).accentColor
            : Colors.transparent,
        child: TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            setState(() {
              _currentRank = index;
            });
          },
          child: Text(
            title,
            style: TextStyle(
              color: _currentRank == index ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'NotoSansCJKkr',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> partsOfRank = [
      _buildRankTabButton('조회수', 0),
      _buildRankTabButton('인기수', 1),
      _buildRankTabButton('유저', 2),
    ];

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: partsOfRank.map((e) => Expanded(child: e)).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Colors.black,
              ),
              Text(
                '전체',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'NotoSansCJKkr'),
              ),
              Icon(
                Icons.keyboard_arrow_right_sharp,
                color: Colors.black,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Center(child: Text('순위'))),
            Expanded(child: Center(child: Text('제목'))),
            Expanded(child: Center(child: Text('작성자'))),
            Expanded(child: Center(child: Text('조회수'))),
          ],
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _postController.postList.length,
            itemBuilder: (context, index) => buildRankName(index),
            separatorBuilder: (context, index) => Divider(),
          ),
        ),
      ],
    );
  }

  Row buildRankName(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildTextWithColor((index + 1).toString(), index),
        buildTextWithColor(_postController.postList[index].title, index),
        buildTextWithColor(_postController.postList[index].writer, index),
        buildTextWithColor(_postController.postList[index].date, index),
      ],
    );
  }

  Widget buildTextWithColor(String text, int index) {
    Color textColor = Colors.black;
    if (index == 0) {
      textColor = Colors.yellow;
    } else if (index == 1) {
      textColor = Colors.grey;
    } else if (index == 2) {
      textColor = Colors.brown;
    }

    return Expanded(
      child: Center(
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
