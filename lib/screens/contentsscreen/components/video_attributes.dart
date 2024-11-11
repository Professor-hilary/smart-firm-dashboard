class Video {
  final int id;
  final String bitmap;
  final String name;
  final String description;
  final String subscriptionTier;
  final String date;
  final int views;

  Video({
    required this.id,
    required this.bitmap,
    required this.name,
    required this.description,
    required this.subscriptionTier,
    required this.date,
    required this.views,
  });
}

final Set<String> urls = {
  'https://destinationuganda.com/wp-content/uploads/2020/10/kampala-road.jpg',
  'https://destinationuganda.com/wp-content/uploads/2020/02/savannah-plains-kidepo-uganda-1024x683.jpg',
  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/ab/2a/07/murchison-falls-view.jpg?w=2000&h=800&s=1',
  'https://destinationuganda.com/wp-content/uploads/2019/07/jinja-quad.jpg',
  'https://i0.wp.com/www.pmldaily.com/wp-content/uploads/2019/06/TouriststrackingMountainGorillasinBwindiImpenetrableForest-700x500.jpg?resize=700%2C500&ssl=1',
  'https://destinationuganda.com/wp-content/uploads/2020/09/where-to-go-places-to-visit-uganda-trip-1200x500.jpg',
  'https://i0.wp.com/www.pmldaily.com/wp-content/uploads/2019/05/Kampala_Kasubi_Tombs.jpg?w=2000&ssl=1',
  'https://skift.com/wp-content/uploads/2022/02/Kara-Tunga-Tours-Life-in-Manyatta-5-1536x1025.jpeg',
  'https://i0.wp.com/www.pmldaily.com/wp-content/uploads/2024/03/Uganda-has-been-once-again-named-among-the-worlds-top-tourism-destinati.jpg?w=1100&ssl=1',
};
final List<Video> videos = [
  Video(
    id: 1,
    bitmap: urls.first,
    name: 'Video 1',
    description:
        'Description for Video 1. Description for Video 6,Description for Video 10 Description for! Description for Video 6,Description for Video 10 Description for, Description for Video 6,Description for Video 10 Description for',
    subscriptionTier: 'Free',
    date:
        '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 10450,
  ),
  Video(
    id: 2,
    bitmap: urls.elementAt(1),
    name: 'Video 2',
    description: 'Description for Video 2',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 4932094,
  ),
  Video(
    id: 3,
    bitmap: urls.elementAt(2),
    name: 'Video 3',
    description: 'Description for Video 3',
    subscriptionTier: 'Free',
    date:
        '${DateTime.now().subtract(const Duration(days: 3)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 89345,
  ),
  Video(
    id: 4,
    bitmap: urls.elementAt(3),
    name: 'Video 4',
    description: 'Description for Video 4',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().subtract(const Duration(days: 33)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 287347,
  ),
  Video(
    id: 5,
    bitmap: urls.elementAt(4),
    name: 'Video 5',
    description: 'Description for Video 5',
    subscriptionTier: 'Free',
    date:
        '${DateTime.now().subtract(const Duration(days: 20)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 49853784,
  ),
  Video(
    id: 6,
    bitmap: urls.elementAt(5),
    name: 'Video 6',
    description:
        'Description for Video 6,Description for Video 10 Description for Video 10 Description for Video 10',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().subtract(const Duration(days: 9)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 435783,
  ),
  Video(
    id: 7,
    bitmap: urls.elementAt(6),
    name: 'Video 7',
    description: 'Description for Video 7',
    subscriptionTier: 'Free',
    date:
        '${DateTime.now().subtract(const Duration(days: 23)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 34211,
  ),
  Video(
    id: 8,
    bitmap: urls.elementAt(7),
    name: 'Video 8',
    description: 'Description for Video 8',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().subtract(const Duration(days: 3)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 309564,
  ),
  Video(
    id: 9,
    bitmap: urls.elementAt(8),
    name: 'Video 9',
    description: 'Description for Video 9',
    subscriptionTier: 'Free',
    date:
        '${DateTime.now().subtract(const Duration(days: 10)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 3049505,
  ),
  Video(
    id: 10,
    bitmap: urls.elementAt(1),
    name: 'Video 10',
    description:
        'Description for Video 10. Description for Video 10, Description for Video 10',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().subtract(const Duration(days: 3)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 98452,
  ),
  Video(
    id: 11,
    bitmap: urls.elementAt(2),
    name: 'Video 10',
    description: 'Description for Video 10',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().subtract(const Duration(days: 9)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 98452,
  ),
  Video(
    id: 10,
    bitmap: urls.elementAt(3),
    name: 'Video 10',
    description: 'Description for Video 10',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().subtract(const Duration(days: 43)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 98452,
  ),
  Video(
    id: 11,
    bitmap: urls.elementAt(4),
    name: 'Video 10',
    description: 'Description for Video 10',
    subscriptionTier: 'Premium',
    date:
        '${DateTime.now().subtract(const Duration(days: 30)).day}-${DateTime.now().month}-${DateTime.now().year}',
    views: 98452,
  ),
];
