import 'package:flutter/material.dart';
import '../Providers/Game_Provider.dart';
class games with ChangeNotifier {
  final List<Game> Games=[
    Game(
      title: "Grand Theft Auto V",
      id: "c1",
      decoration: "Grand Theft Auto V will take full advantage of the power of the PlayStation 4 with across-the-board graphical and technical improvements to deliver a stunning new level of detail. Increased draw distances, finer texture details, denser traffic, and enhanced resolutions all work together to bring new life to the cities, towns, deserts and oceans of Rockstar North’s epic reimagining of Southern California.",
      price: 30,
      subtitle: "Rockstar",
      img: "Assets/Games_image/Gta_v.jpg",
    ),
    Game(
      title: "EFootball PES 2021",
      price: 50,
      img: "Assets/Games_image/pes2021.jpg",
      subtitle: "Konami",
      decoration: " PES 2021 is an updated version of last year's title, efootball PES 2020, providing the latest player data and Club rosters. Due to the delayed Season endings for many leagues, the latest data for certain licensed leagues and teams will be available via updates at launch and after (Internet connection required)",
      id: "c2",
    ),
    Game(
      title: "Call of Duty World ",
      id: "c3",
      price:37.55,
      subtitle: "Activision",
      img: "Assets/Games_image/Call_of_Duty_World_War.jpg",
      decoration: "Call of Duty World War II features stunning visuals. This Call of Duty PS4 game is available here at Souq.com.The Call of Duty World War II redefines World War II for the new generation of gamers. Experience the history’s most monumental war by battling across Europe through iconic locations or land in Normandy on D-Day. This PS4 game lets you experience the bonds of camaraderie",
    ),
    Game(
      title: "World War Z",
      img: "Assets/Games_image/World_War_Z.jpg",
      id: "c4",
      price: 22.33,
      subtitle: "Sony",
      decoration: "Humanity is on the brink of extinction. From New York to Moscow, through Jerusalem, Tokyo and Marseille, the undead apocalypse continues to spread. As the end looms, a hardened few band together to defeat the horde and outlive the dead. ",
    ),
    Game(
      title: "Need For Speed",
      id: "c5",
      price: 31.27,
      subtitle: "EA Sports",
      img: "Assets/Games_image/Need_For_Speed.jpg",
      decoration: "The smell of burnt rubber lingers through the city streets, a remnant of the activities that were carried out during the early hours of the morning. But the darkness of night now gives way to the light of day as the city of Silver Rock begins to spark into life as the sun breaks across the entire Fortune Valley region. ",
    ),
    Game(
      title:'The Last of Us',
      id: "c6",
      price: 35.14,
      subtitle: "Sony",
      decoration: "Ruthless smuggler Joel survives in some of the last Quarantine Zones in a ravaged, post pandemic United States. These sealed, repressive Zones or cities are governed by the remnants of military who have enforced a harsh martial law to ensure survival. Joel operates in the city’s black market smuggling contraband for the the highest bidder,",
      img: "Assets/Games_image/The_Last_of_Us.jpg"
    ),
    Game(
      title: "WWE2K20",
      subtitle: "Visual Concepts",
      img: "Assets/Games_image/WWE_2K20.jpg",
      price: 50,
      decoration: "2K invites players to Step Inside the ring with WWE 2K20. Your favorite WWE Superstars, Legends, Hall of Famers and NXT’s best will join the festivities and celebrate the evolution of the WWE 2K franchise! WWE 2K20 will feature key gameplay improvements,",
      id: "c7",
    ),
    Game(
      id: "c8",
      img: "Assets/Games_image/fifa2020.jpg",
      price: 25,
      subtitle: "EA Sports",
      title: "Fifa 20",
      decoration: "Powered by Frostbite™, EA SPORTS™ FIFA 20 for PlayStation®4 brings two sides of The World’s Game to life - the prestige of the professional stage and an all-new authentic street football experience in EA SPORTS VOLTA FOOTBALL. FIFA 20 innovates across the game,",
    ),
  ];

   Game  findByID (String id){
    return Games.firstWhere((ge){
      return ge.id == id;
    });
  }

}