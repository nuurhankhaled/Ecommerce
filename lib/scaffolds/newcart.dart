import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class NewCard extends StatefulWidget {
  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  var height, width, size;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          elevation: 0,
          title: Text("Our brand", style: TextStyle(fontWeight: FontWeight.bold),),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        backgroundColor:  Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width ,
            height: height ,
            color:  Colors.white,
            child: ListView(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                  child: Text(
                    "Add a New cart ",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                  child: Text(
                    "We Accept ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    Image.asset("assets/images/viisa.png",width: width*0.18,height: height*0.11,),
                    Image.asset("assets/images/visaa.png",width: width*0.18,height: height*0.11),
                    Image.asset("assets/images/vvisa.png",width: width*0.18,height: height*0.11),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                  child: Text(
                    "Card Number ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.fromLTRB(
                        width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your card Number",
                        hintStyle: TextStyle(color: Colors.grey.shade400)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry",
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "MM/YY",
                              hintStyle: TextStyle(color: Colors.grey.shade400)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV",
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.02, width * 0.01, width * 0.03, width * 0.01),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Secure Code",
                              hintStyle: TextStyle(color: Colors.grey.shade400)),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.01, width * 0.1, width * 0.3, width * 0.01),
                      child: Text("Remember This CARD ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    // ignore: sized_box_for_whitespace
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.01, width * 0.1, width * 0.01, width * 0.01),
                      child: Container(
                        width: width*0.2,
                        height: height*0.05,
                        child: FlutterSwitch(
                          toggleSize: 45.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 8.0,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.01, width * 0.1, width * 0.1, width * 0.01),
                  child: Text("our brand will securly Store this card foe faster payment experience "
                    ,style: TextStyle(fontSize: 12,color: Colors.grey.shade400),),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.01, width * 0.01, width * 0.01, width * 0.01),
                  child: Text("Your CVV number will not be stored",
                    style: TextStyle(fontSize: 12,color: Colors.grey.shade400),),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.01, width * 0.2, width * 0.01, width * 0.01),
                  child: Container(width: width * 0.95,
                    height: height * 0.1,color: Colors.white,
                    child: Center(
                      child: SizedBox(
                        width: width * 0.7,
                        height: height * 0.05,
                        child: MaterialButton(onPressed: (){},color: Color.fromRGBO(4, 131, 153 ,1),
                          child:Text("Add My CARD",style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.white),) ,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
