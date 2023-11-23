import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

drawerTile({
  required Color color,
  required String title,
  required BuildContext context,
  required Color titleColor,
  required String icon,
  required Color indicatorColor,
  required VoidCallback onTap,
}){
  
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(top: 16,bottom: 16, right: 10,),
      decoration: BoxDecoration(
        color: color,
    
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 40,
            decoration: BoxDecoration(
              color: indicatorColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8)
              )
            ),
          ),
       const   SizedBox(
            width: 34,
          ),
          SvgPicture.asset(icon, height: 24, width: 24,color: titleColor,),
         const SizedBox(
            width: 12,
          ),
          Text(title, style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: titleColor,
          ),),
        ],
      ),
    ),
  );
}