import 'package:my_anime_app/models/anime.dart';

class ProductService {
  Future<List<Anime>> getAnime() async {
    // simulate API request delay
    await Future.delayed(Duration(seconds: 2));

    return [
      Anime(
          id: 1,
          title: 'Hunter X Hunter',
          image: 'assets/hunter.png',
          episode: 12,
          description:
              "'The story focuses on a young boy named Gon Freecss who discovers that his father, who left him at a young age, is actually a world-renowned Hunter, a licensed professional who specializes in fantastical pursuits such as locating rare or unidentified animal species.'",
          rating: 9.5,
          genre: 'Action'),
      Anime(
          id: 2,
          title: 'One Punch Man',
          image: 'assets/man.png',
          episode: 11,
          description:
              "'It tells the story of Saitama, a superhero who, because he can defeat any opponent with a single punch, grows bored from a lack of challenge.'",
          rating: 9.0,
          genre: 'Action'),
      Anime(
          id: 3,
          title: 'Akame Ga Kill',
          image: 'assets/akame.png',
          episode: 20,
          description:
              "'Follows the story of Tatsumi, a young fighter who sets off with his two friends to make money to send back to his small village. Tatsumi (voiced by Corey Hartzog) travels to the capital city to join the military in hopes of a better life. However, he soon finds out that the capital is extremely corrupt.'",
          rating: 6.5,
          genre: 'Action'),
      Anime(
          id: 4,
          title: 'Attack On Titan',
          image: 'assets/attack.png',
          episode: 9,
          description:
              "'It is set in a world where humanity is forced to live in cities surrounded by three enormous walls that protect them from gigantic man-eating humanoids referred to as Titans; the story follows Eren Yeager, who vows to exterminate the Titans after they bring about the destruction of his hometown.'",
          rating: 9.0,
          genre: 'Action'),
      Anime(
          id: 5,
          title: 'Bleach',
          image: 'assets/bleach.png',
          episode: 10,
          description:
              "'It follows the adventures of a teenager Ichigo Kurosaki, who inherits his parents' destiny after he obtains the powers of a Soul Reaper—a death personification similar to the Grim Reaper—from another Soul Reaper, Rukia Kuchiki.'",
          rating: 8.0,
          genre: 'Action'),
      Anime(
          id: 6,
          title: 'Blue Lock',
          image: 'assets/blue.png',
          episode: 10,
          description:
              "'High school soccer players from across Japan gather for a controversial project designed to create the best and most egoistic striker in the world. Japan keeps losing the World Cup, over and over.'",
          rating: 8.2,
          genre: 'Sports'),
      Anime(
          id: 7,
          title: 'Cowboy Bebop',
          image: 'assets/boy.png',
          episode: 15,
          description:
              "'Amid a rising crime rate, the Inter Solar System Police (ISSP) set up a legalized contract system, in which registered bounty hunters chase criminals and bring them in alive in return for a reward. The series' protagonists are bounty-hunters working from the spaceship Bebop.'",
          rating: 7.5,
          genre: 'Comdey'),
      Anime(
          id: 8,
          title: 'Death Note',
          image: 'assets/death.png',
          episode: 20,
          description:
              "'A high school student named Light Turner discovers a mysterious notebook that has the power to kill anyone whose name is written within its pages, and launches a secret crusade to rid the world of criminals.'",
          rating: 8.5,
          genre: 'Drama'),
      Anime(
          id: 9,
          title: 'Demon Slayer',
          image: 'assets/demon.png',
          episode: 7,
          description:
              "'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.'",
          rating: 9.0,
          genre: 'Action'),
      Anime(
          id: 10,
          title: 'Dragon Ball',
          image: 'assets/dragon.png',
          episode: 50,
          description:
              "'Dragon Ball tells the tale of a young warrior by the name of Son Goku, a young peculiar boy with a tail who embarks on a quest to become stronger and learns of the Dragon Balls, when, once all 7 are gathered, grant any wish of choice.'",
          rating: 9.5,
          genre: 'Action'),
      Anime(
          id: 11,
          title: 'Haykiu',
          image: 'assets/haykiu.png',
          episode: 21,
          description:
              "' Junior high school student, Shoyo Hinata, becomes obsessed with volleyball after catching a glimpse of Karasuno High School playing in Nationals on TV. Of short stature himself, Hinata is inspired by a player the commentators nickname 'The Little Giant', Karasuno's short but talented wing spiker.'",
          rating: 8.0,
          genre: 'Sports'),
      Anime(
          id: 12,
          title: 'My Hero Academia',
          image: 'assets/hero.png',
          episode: 18,
          description:
              "'A superhero-loving boy without any powers is determined to enroll in a prestigious hero academy and learn what it really means to be a hero. A superhero-loving boy without any powers is determined to enroll in a prestigious hero academy and learn what it really means to be a hero.'",
          rating: 7.8,
          genre: 'Action'),
      Anime(
          id: 13,
          title: 'Jujutsu Kaisen',
          image: 'assets/juju.png',
          episode: 16,
          description:
              "'Yuji Itadori, a kind-hearted teenager, joins his school's Occult Club for fun, but discovers that its members are actual sorcerers who can manipulate the energy between beings for their own use. He hears about a cursed talisman - the finger of Sukuna, a demon - and its being targeted by other cursed beings.'",
          rating: 8.8,
          genre: 'Action'),
      Anime(
          id: 14,
          title: 'One Piece',
          image: 'assets/one.png',
          episode: 500,
          description:
              "'The series focuses on Monkey D. Luffy—a young man made of rubber after unintentionally eating a Devil Fruit—who sets off on a journey from the East Blue Sea to find the deceased King of the Pirates Gol D. Roger's ultimate treasure known as the (One Piece), and takeover his prior title.",
          rating: 9.3,
          genre: 'Action'),
      Anime(
          id: 15,
          title: 'Naruto Shipuden',
          image: 'assets/naruto.png',
          episode: 120,
          description:
              "' It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.'",
          rating: 9.0,
          genre: 'Drama'),
      Anime(
          id: 16,
          title: 'Tokyo Ghoul',
          image: 'assets/tokyo.png',
          episode: 22,
          description:
              "'Set in a world where humans live in constant fear of ghouls - superpowered humanoid beings who feed on human flesh to survive, a shy college student named Kaneki Ken, who is nearly killed in an attack by one of these monsters, becomes a half-ghoul himself after receiving an organ transplant from the ghoul.'",
          rating: 8.6,
          genre: 'Drama'),
      Anime(
          id: 17,
          title: 'Spy X Family',
          image: 'assets/spy.png',
          episode: 14,
          description:
              "'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own, and all three must strive to keep together.'",
          rating: 8.5,
          genre: 'Comdey'),
    ];
  }

  final List<Map<String, String>> categories = [
    {
      "name": "Action",
      "image": "action.jpg",
      "description": "Anime with intense action scenes and battles."
    },
    {
      "name": "Drama",
      "image": "drama.jpg",
      "description": "Anime with emotional and serious storylines."
    },
    {
      "name": "Comedy",
      "image": "comedy.jpg",
      "description": "Anime with funny and lighthearted moments."
    },
    {
      "name": "Romance",
      "image": "romance.jpg",
      "description": "Anime with romantic relationships as a central theme."
    },
  ];
}
