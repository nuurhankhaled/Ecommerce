import 'package:ecommerceproject/scaffolds/newcart.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/radiobutton.dart';


class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var height, width, size;

  String selected = "off";
  String cash = "off";
  String valU = "off";
  String interest_free = "off";

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
        title:  Padding(
          padding:  EdgeInsets.only(left :110.0, top: 10),
          child: Text(
            "Checkout",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey.shade200,
      body:
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.01),
                child: Container(
                  width: width * 1,
                  height: height * 0.2,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.02,
                                width * 0.47, width * 0.02),
                            child: Text(
                              "SHIP TO ",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "Change",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width * 0.95,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade200, //color of border
                              width: 2, //width of border
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(width * 0.015,
                                    width * 0.02, width * 0.02, width * 0.001),
                                child: Text("Home"),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(width * 0.001,
                                        width * 0.02, width * 0.02, width * 0.001),
                                    child: Icon(Icons.location_on),
                                  ),
                                  Text("X5VM+75- EL-Giza,Cairo-Egypt"),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(width * 0.015,
                                    width * 0.02, width * 0.02, width * 0.001),
                                child: Text("+20-100000119"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.01,width * 0.02, width * 0.02, width * 0.01),
                child: Container(
                  width: width * 95,
                  height: height * 0.5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.01,width * 0.02, width * 0.47, width * 0.03),
                        child: Text(
                          "Payment Method",
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                      ),
                      RadioButton( text: "Debit/Cerdit Card", selected: selected,text2:"EMI plans avaiable for select cards",),
                      RadioButton( text: "Cash on Delievery", selected: cash,text2: "",),
                      RadioButton( text: "Pay with ValU", selected: valU,text2: "",),
                      RadioButton( text: "Split in 4,interest-free", selected:interest_free ,text2: "" ,),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.02, width * 0.02,
                    width * 0.02, width * 0.02),
                child: Container(
                  width: width * 0.75,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey.shade200, //color of border
                      width: 2, //width of border
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.04,
                              width * 0.47, width * 0.02),
                          child: Text("subtotal"),
                        ),
                        Text("EGP 2.799.00"),
                      ],),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.02,
                              width * 0.47, width * 0.02),
                          child: Text("Shipping Fee"),
                        ),
                        Text("FREE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                      ],),
                      Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.01, width * 0.02,
                            width * 0.02, width * 0.02),
                        child: Container(
                          width: width*99,
                          height: height*0.003,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.02,
                              width * 0.47, width * 0.02),
                          child: Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        Text("EGP 2.799.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      ],),
                    ],
                  ),
                ),
              ),
              Container(
                width: width * 0.95,
                height: height * 0.1,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.03, width * 0.02,
                      width * 0.02, width * 0.02),
                  child: Center(
                    child: SizedBox(
                      width: width * 0.7,
                      height: height * 0.05,
                      child: MaterialButton(onPressed: (){

                      },color: Color.fromRGBO(4, 131, 153 ,1),
                        child:Text("PLACE ORDER",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),) ,),
                    ),
                  ),
                ),
              )

            ],
          ),

    );
  }
}
