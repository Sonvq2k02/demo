import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void getBottomSheetListening(BuildContext context) {
  List<Color> themes = [
    const Color(0xFFFFFFFF),
    const Color(0xFF000000),
    const Color(0xFFf0cea0),
  ];

  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(themes.length, (index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                                shape: BoxShape.circle,
                                color: themes[index]),
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: themes[index]),
                        ),
                      );
                    }),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            "TT",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            "Tt",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Container(
                      height: 4,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 145),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Aa",
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  Text(
                    "Aa",
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Container(
                      height: 4,
                      width: 220,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 215),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.light_mode,
                    color: Colors.black38,
                    size: 18,
                  ),
                  Icon(
                    Icons.light_mode,
                    color: Colors.black,
                    size: 28,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
