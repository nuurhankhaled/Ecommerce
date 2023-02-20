import 'package:flutter/material.dart';

class Custom extends StatefulWidget {
  String x;
  dynamic y;
  dynamic price;

  Custom(this.x, this.y, this.price);

  @override
  State<Custom> createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  var height, width, size;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: EdgeInsets.only(
          top: width * 0.01,
          left: width * 0.03,
          right: width * 0.03,
          bottom: width * 0.01),
      child: Container(
        width: 310,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: NetworkImage(widget.x),
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: width * 0.08, left: width * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: width * 0.02,
                      ),
                      child: Text(
                        widget.y,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.pink),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.37),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  counter--;
                                });
                              },
                              icon: Icon(Icons.remove_circle,
                                  color: Color.fromRGBO(4, 131, 153, 1)),
                            ),
                            Text(
                              '$counter',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(Icons.add_circle_outlined,
                                  color: Color.fromRGBO(4, 131, 153, 1)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
