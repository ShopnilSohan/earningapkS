import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _isAnimated = false;
  bool _isBallanceShown = false;
  bool _isBallance = true;
  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: sohan / 4,
              width: sohan1 / 1,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(80))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/boy.png'),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// userName
                        Padding(
                          padding: EdgeInsets.only(top: 50, left: 20),
                          child: Text('Shopnil Sohan',
                              style: GoogleFonts.lobster(
                                textStyle: TextStyle(
                                    fontSize: 28, color: Colors.black),
                              )),
                        ),
                        SizedBox(height: 15),

                        /// Button
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: changeState,
                            child: Container(
                              width: sohan1 / 2.7,
                              height: sohan / 24,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  /// ৳ 50.00
                                  AnimatedOpacity(
                                      opacity: _isBallanceShown ? 1 : 0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: const Text('৳ 50.00',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20))),

                                  /// ব্যালেন্স দেখুন
                                  AnimatedOpacity(
                                      opacity: _isBallance ? 1 : 0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: Text('ব্যালেন্স দেখুন',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      )),

                                  /// Circle
                                  AnimatedPositioned(
                                      duration:
                                          const Duration(milliseconds: 1100),
                                      left: _isAnimated == false ? 5 : 128,
                                      curve: Curves.fastOutSlowIn,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                            height: 20,
                                            width: 20,
                                            // padding: const EdgeInsets.only(bottom: 4),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: FittedBox(
                                              child: Text(
                                                '৳',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 20,
                        child: Container(
                          height: 100,
                          width: sohan1 / 2.3,
                        ),
                      ),
                      Card(
                        elevation: 20,
                        child: Container(
                          height: 100,
                          width: sohan1 / 2.3,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 20,
                        child: Container(
                          height: 100,
                          width: sohan1 / 2.3,
                        ),
                      ),
                      Card(
                        elevation: 20,
                        child: Container(
                          height: 100,
                          width: sohan1 / 2.3,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 20,
                        child: Container(
                          height: 100,
                          width: sohan1 / 2.3,
                        ),
                      ),
                      Card(
                        elevation: 20,
                        child: Container(
                          height: 100,
                          width: sohan1 / 2.3,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void changeState() async {
    _isAnimated = true;
    _isBallance = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 700),
        () => setState(() => _isBallanceShown = true));
    await Future.delayed(const Duration(seconds: 3),
        () => setState(() => _isBallanceShown = false));
    await Future.delayed(const Duration(milliseconds: 200),
        () => setState(() => _isAnimated = false));
    await Future.delayed(const Duration(milliseconds: 700),
        () => setState(() => _isBallance = true));
  }
}
