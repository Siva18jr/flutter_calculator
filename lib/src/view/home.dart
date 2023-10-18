import 'dart:developer';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String num = "";
  String sec = "";
  int third = 0;
  String opp = "";
  String endResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
                "Calculator",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            )
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 45, 0, 28),
                          child: SizedBox(
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  sec,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  opp,
                                  style: const TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  num,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          endResult,
                          style: const TextStyle(
                              color: Colors.lightGreenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        )
                      ],
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      numButton(
                                          val: 7
                                      ),
                                      numButton(
                                          val: 8
                                      ),
                                      numButton(
                                          val: 9
                                      ),
                                      oppButton(
                                          val: "+"
                                      )
                                    ]
                                )
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  numButton(
                                      val: 4
                                  ),
                                  numButton(
                                      val: 5
                                  ),
                                  numButton(
                                      val: 6
                                  ),
                                  oppButton(
                                      val: "-"
                                  )
                                ]
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      numButton(
                                          val: 1
                                      ),
                                      numButton(
                                          val: 2
                                      ),
                                      numButton(
                                          val: 3
                                      ),
                                      oppButton(
                                          val: "x"
                                      )
                                    ]
                                )
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70
                                      ),
                                      child: const Text(
                                          "_",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      )
                                  ),
                                  numButton(
                                      val: 0
                                  ),
                                  ElevatedButton(
                                      onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70
                                      ),
                                      child: const Text(
                                          "-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      )
                                  ),
                                  oppButton(
                                      val: "%"
                                  )
                                ]
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 128,
                                        child: ElevatedButton(
                                            onPressed: (){

                                              setState(() {

                                                num = "";
                                                sec = "";
                                                third = 0;
                                                opp = "";
                                                endResult = "";

                                              });

                                              log(num);

                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red
                                            ),
                                            child: const Text(
                                                "Reset",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                )
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        width: 128,
                                        child: ElevatedButton(
                                            onPressed: (){

                                              int res = int.parse(num);

                                              if(opp == "+"){

                                                res += third;

                                              }else if(opp == "-"){

                                                res = third - res;

                                              }else if(opp == "x"){

                                                res = third * res;

                                              }else if(opp == "%"){

                                                res = third ~/ res;

                                              }

                                              setState(() {

                                                endResult = "= $res";
                                                opp = "";
                                                third = res;

                                              });

                                              log(third.toString());

                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green
                                            ),
                                            child: const Text(
                                                "=",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black
                                                )
                                            )
                                        ),
                                      )
                                    ]
                                )
                            )
                          ],
                        )
                    )
                )
            )
          ],
        )
    );
  }

  Widget numButton({required int val}){

    return ElevatedButton(
        onPressed: (){

          setState(() {

            num += val.toString();

          });

        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white70
        ),
        child:  Text(
            "$val",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            )
        )
    );

  }

  Widget oppButton({String? val}){

    return ElevatedButton(
        onPressed: (){

          if(val == "+"){

            setState(() {

              sec = num;

              if(endResult == ""){

                third = third + int.parse(sec);

              }else{

                log("none");

                if(opp == "+") {

                  third = third + int.parse(sec);

                }else if(opp == "-"){

                  third = third - int.parse(sec);

                }else if(opp == "x"){

                  third = third * int.parse(sec);


                }else if(opp == "%"){

                  third = third ~/ int.parse(sec);

                }

              }

              num = "";
              sec = third.toString();
              opp = "+";
              endResult = third.toString();

            });

          }else if(val == "-"){

            setState(() {

              sec = num;

              if(third == 0){

                third = int.parse(sec) - third;

              } else if(third != 0 && endResult == ""){

                third = third - int.parse(sec);

              }else{

                log("none");

                if(opp == "+"){

                  third = third + int.parse(sec);

                } else if(opp == "-"){

                  third = third - int.parse(sec);

                }else if(opp == "x"){

                  third = third * int.parse(sec);

                }else if(opp == "%"){

                  third = third ~/ int.parse(sec);

                  // }

                }

              }

              num = "";
              opp = "-";
              sec = third.toString();
              endResult = third.toString();

              log("add $endResult");

            });

          }else if(val == "x"){

            setState(() {

              sec = num;

              if(third == 0){

                third = int.parse(sec);

              }else if(third !=0 && endResult == ""){

                third = third * int.parse(sec);

              }else{

                log("none");

                if(opp == "+") {
                  third = third + int.parse(sec);
                  // print("add = $third");

                }else if(opp == "-"){

                  third = third - int.parse(sec);
                  // print("add = $third");

                }else if(opp == "x"){

                  third = third * int.parse(sec);


                }else if(opp == "%"){

                  third = third ~/ int.parse(sec);

                }

              }

              num = "";
              opp = "x";
              sec = third.toString();
              endResult = third.toString();

            });

          }else if(val == "%"){

            setState(() {

              sec = num;

              if(third == 0){

                third = int.parse(sec);

              }else if(third !=0 && endResult == ""){

                third = third ~/ int.parse(sec);

              }else{

                log("none");

                if(opp == "+") {

                  third = third + int.parse(sec);

                }else if(opp == "-"){

                  third = third - int.parse(sec);

                }else if(opp == "x"){

                  third = third * int.parse(sec);

                }else if(opp == "%"){

                  third = third ~/ int.parse(sec);

                }

              }

              num = "";
              opp = "%";
              sec = third.toString();
              endResult = third.toString();

            });

          }else{

            log("invalid");

          }

          log("value = $third");

        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreenAccent
        ),
        child: Text(
            "$val",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            )
        )
    );

  }

}