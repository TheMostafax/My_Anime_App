import 'package:my_anime_app/models/categorym.dart';

class CategoryService {
  Future<List<Category>> getCategory() async {
    // simulate API request delay
    await Future.delayed(Duration(seconds: 2));

    return [
      Category(
          title: 'Action',
          image: 'assets/action.png',
          description: "Anime with intense action scenes and battles.",
          genre: 'Action'),
      Category(
          title: 'Drama',
          image: 'assets/drama.png',
          description: "Anime with emotional and serious storylines.",
          genre: 'Drama'),
      Category(
          title: 'Comedy',
          image: 'assets/comedy.png',
          description: "Anime with funny and lighthearted moments.",
          genre: 'Comedy'),
      Category(
          title: 'Romance',
          image: 'assets/romance.png',
          description: "Anime with romantic relationships as a central theme.",
          genre: 'Romance'),
      Category(
          title: 'Sports',
          image: 'assets/sports.png',
          description: "Anime with Sports content as a central theme.",
          genre: 'Sports'),
    ];
  }
}
