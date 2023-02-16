import 'package:flutter/material.dart';

import 'package:flutter_screens_widgets/utils/constants.dart';
import 'package:flutter_screens_widgets/utils/custom_functions.dart';
import 'package:flutter_screens_widgets/utils/widget_functions.dart';
import 'package:flutter_screens_widgets/widgets/border_box.dart';
import '../models/housing.dart';
import '../screens/housing_more_detail.dart';

class RealStateItem extends StatelessWidget {
  final HousingData itemData;

  const RealStateItem(this.itemData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(HousingMoreDetail.routeName, arguments: itemData.Id),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(itemData.image),
                ),
                const Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.favorite_border,
                      color: COLOR_BLACK,
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  '${formatCurrency(itemData.amount)}',
                  style: Theme.of(context).textTheme.headline1,
                ),
                addHorizontalSpace(9),
                Text(
                  '${itemData.address}',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              '${itemData.bedrooms} bedrooms/ ${itemData.bathrooms} bathrooms',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
