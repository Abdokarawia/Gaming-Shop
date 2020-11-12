import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Category_Provider.dart';
import '../Providers/Categories_Provider.dart';
class CategoryWidget extends StatelessWidget {
  int index;
  CategoryWidget({this.index});

  @override
  Widget build(BuildContext context) {
    final Mediaqueryheight =MediaQuery.of(context).size.height;
    final Mediaquerywidth =MediaQuery.of(context).size.width;
    final category =Provider.of<Category>(context);
    final Categories =Provider.of<categories>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(35),
      highlightColor: Colors.white,
      radius: 35,
      onTap: (){
        Categories.selectColor(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: Mediaquerywidth*0.25,
          decoration: BoxDecoration(
            color: Categories.selectindex==index ? Colors.blue.withOpacity(0.9) :Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  height: Mediaqueryheight*0.03,
                  child: FittedBox(child: Icon(category.icon, color:Categories.selectindex==index ? Colors.white:Colors.black,))),
              Container(
                height: Mediaqueryheight*0.03,
                child: FittedBox(
                  child: Text(category.text,style: TextStyle(
                    color: Categories.selectindex==index? Colors.white: Colors.black,fontSize: 17
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
