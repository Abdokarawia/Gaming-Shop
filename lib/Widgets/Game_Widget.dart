import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/Game_Details_Screen.dart';
import '../Providers/Game_Provider.dart';

class Game_Widget extends StatelessWidget {
  Widget icon(Color color, double height) {
    return Container(
      height: height,
      child: FittedBox(
        child: Icon(
          Icons.star,
          size: 22,
          color: color,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final Mediaqueryheight = MediaQuery.of(context).size.height;
    final Mediaquerywidth = MediaQuery.of(context).size.width;
    final game=Provider.of <Game> (context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(GameDetails.routename ,arguments: game.id );
      },
      child: Container(
          width: Mediaquerywidth * 0.35,
          child: Column(
            children: <Widget>[
              Image.asset(game.img),
              SizedBox(
                height: Mediaqueryheight * 0.005,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: Mediaqueryheight*0.025,
                      child: FittedBox(
                    child: Text(
                      game.title,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  )),
                  SizedBox(
                    height: Mediaqueryheight * 0.002,
                  ),
                  Row(
                    children: <Widget>[
                      icon(Colors.amber, Mediaqueryheight * 0.02),
                      icon(Colors.amber, Mediaqueryheight * 0.02),
                      icon(Colors.amber, Mediaqueryheight * 0.02),
                      icon(Colors.amber, Mediaqueryheight * 0.02),
                      icon(Colors.grey.withOpacity(0.4), Mediaqueryheight * 0.02)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
