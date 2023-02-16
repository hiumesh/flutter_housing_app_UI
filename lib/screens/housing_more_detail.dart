import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/border_box.dart';
import '../utils/constants.dart';
import '../models/housing.dart';
import '../providers/housing.dart';
import '../utils/widget_functions.dart';
import '../utils/custom_functions.dart';
import '../widgets/option_button.dart';

class HousingMoreDetail extends StatelessWidget {
  static const String routeName = "/housing_detail";
  const HousingMoreDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final houseId = ModalRoute.of(context)?.settings.arguments as String;
    final HousingData data = Provider.of<Housing>(context).findById(houseId);
    final size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(data.image),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: BorderBox(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.arrow_back,
                                color: COLOR_BLACK,
                              ),
                            ),
                          ),
                          BorderBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.favorite_border,
                              color: COLOR_BLACK,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              addVerticalSpace(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${formatCurrency(data.amount)}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        addHorizontalSpace(9),
                        Text(
                          '${data.address}',
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                    BorderBox(
                      width: 160,
                      height: 50,
                      child: Center(
                        child: Text(
                          "20 Hours ago",
                          style: themeData.textTheme.headline3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "House Information",
                  style: themeData.textTheme.headline4,
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                    {"text": "Square foot", "value": data.area},
                    {"text": "Bedrooms", "value": data.bedrooms},
                    {"text": "Bathrooms", "value": data.bathrooms},
                    {"text": "Garage", "value": data.garage}
                  ]
                          .map((e) => Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: BorderBox(
                                      width: 80,
                                      height: 80,
                                      child: Center(
                                        child: Text(
                                          e["value"].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpace(10),
                                  Text(
                                    e["text"] as String,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  )
                                ],
                              ))
                          .toList()),
                ),
              ),
              addVerticalSpace(20),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      data.description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionButton(
                  icon: Icons.message,
                  text: "Message",
                  width: size.width * 0.35,
                ),
                addHorizontalSpace(20),
                OptionButton(
                  icon: Icons.call,
                  text: "Call",
                  width: size.width * 0.35,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
