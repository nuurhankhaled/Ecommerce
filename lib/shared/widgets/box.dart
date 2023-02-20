import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  var size,height,width;
  String? name;
  String? from;
  String? to;
  String? photo;
  SearchContainer(this.name,this.from,this.to,this.photo);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Container(
      width: width*0.7,
          height: 165,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.5,
                blurRadius: 0.5,
              ),
            ],
            borderRadius: BorderRadius.circular(18),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*0.03,left: width*0.05),
            child: Row(

              children: [
                Container(
                  width: width * 0.15,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.9,
                        spreadRadius: 0.1,
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                        photo!,
                      ),fit: BoxFit.cover,
                      scale: 1,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width*0.04),
                  child: Container(
                      width:120,child: Text(name!, style: TextStyle(fontFamily: "sign", fontSize: 18, fontWeight: FontWeight.bold),)),
                ),


              ],
            ),
          ),

          Padding(
            padding:EdgeInsets.only(left: width*0.47),
            child: Text(from!,style: TextStyle(fontFamily: "sign", fontSize: 17, fontWeight: FontWeight.bold,color: Colors.black)),
          ),
          Padding(
            padding:EdgeInsets.only(left: width*0.47),
            child: Text(to!,style: TextStyle(fontFamily: "sign", fontSize: 17, fontWeight: FontWeight.bold,color: Colors.black)),
          )
        ],
      ),
          );

  }
}
