import 'package:app/widgets/scanner.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:app/home.dart';

class addMoney extends StatefulWidget {
  addMoney({Key? key}) : super(key: key);

  @override
  State<addMoney> createState() => _addMoneyState();
}

class _addMoneyState extends State<addMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff23242f),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF23242F),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'How Much are you tipping today?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      height: 1.1764705882352942,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: AutoSizeTextField(
                      keyboardType: TextInputType.number,
                      controller: _controller,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 45,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                        height: 1.1702127659574468,
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: const EdgeInsets.all(20)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              TextButton(
                onPressed: () {
                  null;
                },
                child: Text(
                  'Tip',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    color: const Color(0xff24b781),
                    fontWeight: FontWeight.w600,
                    height: 1.3714285714285714,
                    shadows: [
                      Shadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              )
            ],
          ),
        ));
  }
}

final TextEditingController _controller = TextEditingController(text: "\$");
