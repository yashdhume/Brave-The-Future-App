import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/StoryBoard/StoryBoardItem.dart';
import 'package:brave_the_future/ui/StoryBoard/Story.dart';
import 'package:brave_the_future/ui/StoryBoard/page_transformer.dart';

class StoryBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);

                  return StoryBoardItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}