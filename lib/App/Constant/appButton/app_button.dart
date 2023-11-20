import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

appButton({
  required double horizontalPadding,
  required double verticalPadding,
  required Color color,
  required String title,
  required double radius,
  required BuildContext context,
  required Color titleColor,
  required double fontSize,
  required FontWeight fontWeight,
  required VoidCallback onTap,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,vertical: verticalPadding
      ),
      child: Text(title, style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: titleColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),),
    ),
  );
}

appIconButton({
  required double horizontalPadding,
  required double verticalPadding,
  required Color color,
  required String title,
  required double radius,
  required BuildContext context,
  required Color titleColor,
  required double fontSize,
  required FontWeight fontWeight,
  required VoidCallback onTap,
  required String icon,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,vertical: verticalPadding
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon, color: titleColor,height: 24,width: 24,),
          const SizedBox(
            width: 25,
          ),
          Text(title, style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: titleColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),),
        ],
      ),
    ),
  );
}