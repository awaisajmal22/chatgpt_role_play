import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

drawerTile({
  required Color color,
  required String title,
  required BuildContext context,
  required Color titleColor,
  required String icon,
  required VoidCallback onTap,
}){
  final size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical:16,),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3)
    
      ),
      child: Row(
        children: [
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