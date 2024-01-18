import 'package:flutter/material.dart';
import 'exercise_item.dart';

class CenteredHorizontalListView extends StatefulWidget {
  final List<String> exerciseList;

  const CenteredHorizontalListView({required this.exerciseList, super.key});

  @override
  State<CenteredHorizontalListView> createState() =>
      _CenteredHorizontalListViewState();
}

class _CenteredHorizontalListViewState
    extends State<CenteredHorizontalListView> {
  final PageController _pageController =
      PageController(viewportFraction: 1 / 3, initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.exerciseList.length,
        itemBuilder: (BuildContext context, int index) {
          // Calculate the position of the item relative to the center
          //double position = index - _pageController.page!;
          // Failed assertion: line 385 pos 7: '!hasPixels || hasContentDimensions'
          return Center(child: ExerciseItem(child: widget.exerciseList[index]));
        });
  }
}
