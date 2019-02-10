class StoryItem {
  StoryItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <StoryItem>[
  new StoryItem(title: '', category: '', imageUrl: 'assets/pictures/Story/1.png',),
  new StoryItem(title: '', category: '', imageUrl: 'assets/pictures/Story/2.png',),
  new StoryItem(title: '', category: '', imageUrl: 'assets/pictures/Story/3.png',),
];