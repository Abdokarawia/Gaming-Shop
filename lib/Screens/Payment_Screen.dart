import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Providers/Cart_Provider.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  static const routename = 'goToPaymentScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final Mediaqueryheight = MediaQuery.of(context).size.height;
    final Mediaquerywidth = MediaQuery.of(context).size.width;
    final Mediaquerytop = MediaQuery.of(context).padding.top;
    final appbar = AppBar(
      backgroundColor: Color(0xffF7FAFE),
      leading: Container(
        height: 40,
        width: 40,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.blue,
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xffF7FAFE),
            borderRadius: BorderRadius.circular(20)),
      ),
      elevation: 0,
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.more_vert,size: 24,color: Colors.blue,),
          ),
        ),
      ],
      title: Text("Payment data",style: Theme.of(context).textTheme.body1,),
    );
    final Mediaquery =
        (Mediaqueryheight - appbar.preferredSize.height - Mediaquerytop);
    return Scaffold(
      backgroundColor: Color(0xffF7FAFE),
      appBar: appbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: Mediaquery*0.05,
              child: FittedBox(child: Text("Total Price",style: Theme.of(context).textTheme.subhead,)),
            ),
          ),
          Container(
            height: Mediaquery*0.1,
            child: Row(
              children: <Widget>[
                SizedBox(width: Mediaquerywidth*0.025,),
                Container(
                  height: Mediaquery*0.08,
                  width: Mediaquerywidth*0.35,
                  child: FittedBox(
                    child: Text("\$"+cart.total.toString(),style:TextStyle(
                        fontSize: 27,color: Colors.blue,fontWeight: FontWeight.w600,fontFamily: "PTSansNarrow"
                    ) ,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Mediaquery*0.01,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: Mediaquery*0.05,
                      child: FittedBox(
                        child: Text("Payment methods ",
                          style: Theme.of(context).textTheme.subtitle,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Mediaquery*0.01,),
               Row(
                 children: <Widget>[
                   Container(
                     height: Mediaquery*0.1,
                     width: Mediaquerywidth*0.3,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.blue
                     ),
                     child: Align(
                         alignment: Alignment.center,
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Container(
                                 height: Mediaquery*0.05,
                                 child: FittedBox(child: Text("Credit",style: Theme.of(context).textTheme.display1,))),
                             Container(
                               height: Mediaquery*0.05,
                               child: FittedBox(child: Icon(Icons.check_circle_outline,size: 30,color: Colors.white,))
                             )
                           ],
                         ),
                     ),
                   ),
                 ],
               ),
                SizedBox(height: Mediaquery*0.02,),
               Row(
                 children: <Widget>[

                   Container(
                       height: Mediaquery*0.045,
                       child: FittedBox(child: Text("Card number",style: Theme.of(context).textTheme.subtitle,))),
                 ],
               ),
                SizedBox(height: Mediaquery*0.01,),
                Container(
                  height: Mediaquery*0.085,
                  width: Mediaquerywidth*0.97,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: "****  ****  ****  ****",

                        icon: Image.asset("Assets/images/Visa_Mastercard.png")
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Mediaquery*0.02,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[

                        Container(
                            height: Mediaquery*0.045,
                            child: FittedBox(child: Text(" Valid until",style: Theme.of(context).textTheme.subtitle,))),
                      ],
                    ),
                    SizedBox(height: Mediaquery*0.01,),
                    Container(
                      height: Mediaquery*0.075,
                      width: Mediaquerywidth*0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                            hintText: "Month / year"
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: Mediaquerywidth*0.05,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            height: Mediaquery*0.045,
                            child: FittedBox(child: Text(" Cvv",style: Theme.of(context).textTheme.subtitle,))),
                      ],
                    ),
                    SizedBox(height: Mediaquery*0.01,),
                    Container(
                      height: Mediaquery*0.075,
                      width: Mediaquerywidth*0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "   * * *",
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: Mediaquery*0.01,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Container(
                    height: Mediaquery*0.045,
                    child: FittedBox(child: Text(" Card holder",style: Theme.of(context).textTheme.subtitle,))),
              ],
            ),
          ),
          SizedBox(height: Mediaquery*0.015,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: Mediaquery*0.09,
              width: Mediaquerywidth*0.97,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your  name  and  surname",
                      icon:Icon(Icons.map,size: 25)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: Mediaquery*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Save card data for future payments",style: Theme.of(context).textTheme.subtitle,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CupertinoSwitch(value: false, onChanged: (val){
                 return val!=val;
                }),
              )
            ],
          ),
          SizedBox(height: Mediaquery*0.01,),
          Align(alignment: Alignment.center,
            child: InkWell(
              onTap: (){},
              child: Container(
                  height: Mediaquery*0.08,
                  width: Mediaquerywidth*0.89,
                  decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: Mediaquery*0.042,
                        child: FittedBox(child: Text("Apply Payment",style: Theme.of(context).textTheme.display1,))),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
