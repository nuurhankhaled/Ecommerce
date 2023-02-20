import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/boarding_model.dart';
import 'login.dart';


class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // const OnBoarding({Key? key}) : super(key: key);
  List<BoardingModel> boarding =
  [
    BoardingModel(
        image: 'assets/images/10117.jpg',
        title: 'ONLINE CART',
        body: 'Select your future pur-chases with smart online shopping cart',
    ),
    BoardingModel(
    image: 'assets/images/4770613.jpg',
    title: ' HASSLES FREE PAYMENTS',
    body: 'Pay as per your convenience,we accept all credit and debit cards',
    ),
      BoardingModel(
        image: 'assets/images/hopp.jpg',
        title: 'SALES AND GIFTS',
        body: 'Holiday sales and Birthday gifts.Various choice and categories',
      ),

  ];

  bool isLast = false;

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions:
        [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(onPressed: ()
                {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                },
                child: Text('SKIP',style: TextStyle(fontSize: 20.0),),),
          ),

        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children:
            [
              Expanded(
                child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: boardController,
                    itemBuilder: (context,index) => BuildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  onPageChanged: (index)
                  {
                    if (index== boarding.length-1)
                    {
                      setState(()
                      {
                        isLast = true;
                      });
                    }else
                      {
                        setState(()
                        {
                          isLast= false;
                        });
                      }
                  },
                ),
              ),
              SizedBox(height: 40.0,),
              Row(
                children:
                [
                 SmoothPageIndicator(
                     controller: boardController,
                     effect: WormEffect(
                       activeDotColor: Color.fromRGBO(4, 131, 153 ,1),
                       dotWidth: 12,
                       dotHeight: 12,
                     ),
                     count: boarding.length
                 ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Color.fromRGBO(4, 131, 153 ,1),
                    onPressed: ()
                  {
                    if(isLast)
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                      }else
                        {
                              boardController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }

                  },
                  child: Icon(Icons.arrow_forward_ios),
                    //backgroundColor: Colors.cyan,
                  )
                ],
              )
            ],
          ),
        )
    );
  }

    Widget BuildBoardingItem(BoardingModel model)=> Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Expanded(child: Image(image: AssetImage('${model.image}'))),
        Text('${model.title}',style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,),),
        SizedBox(height: 10.0,),
        Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: Text('${model.body}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
        ),
        SizedBox(height: 30.0,),

      ],
    );
}

