import 'package:flutter/material.dart';
import 'package:flutter_screens_widgets/utils/constants.dart';
import 'package:flutter_screens_widgets/widgets/option_button.dart';
import 'package:provider/provider.dart';

import '../widgets/border_box.dart';
import '../utils/widget_functions.dart';
import '../widgets/real_state_item.dart';
import '../providers/housing.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BorderBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        ),
                      ),
                      BorderBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ),
                      )
                    ],
                  ),
                ),
                addVerticalSpace(25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "City",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                addVerticalSpace(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "San Francisco",
                    style: themeData.textTheme.headline1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: COLOR_GREY,
                    height: 25,
                  ),
                ),
                addVerticalSpace(10),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      "< \$220,000",
                      "For Sale",
                      "3-4 bed",
                      "1000> sqft"
                    ].map((filter) => ChoiceOption(filter)).toList(),
                  ),
                ),
                addVerticalSpace(25),
                Expanded(
                  child: Consumer<Housing>(
                    builder: (ctx, housing, child) => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      itemBuilder: (ctx, index) {
                        return RealStateItem(housing.list[index]);
                      },
                      itemCount: housing.list.length,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 20,
              width: size.width,
              child: Center(
                child: OptionButton(
                  icon: Icons.map,
                  text: "Map View",
                  width: size.width * 0.35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;
  const ChoiceOption(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
