
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageTile extends StatelessWidget {
  final bool isUSerSide;
  const MessageTile({
    required this.isUSerSide,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     isUSerSide ? Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
        
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
    image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT98hCxMihjMR2g9cpRTUmEt-mVc1oi1iie-VJSSmK_tnSwh6YMe1nOl1FHyvdZl-pFXa0&usqp=CAU'), fit: BoxFit.cover)
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        Text('Hi how Are you?', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Color(0xff0F0F0F),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),)
      ],
    ),
    ) : Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffEAEAEA),
        
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Text('Hi how Are you?', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Color(0xff0F0F0F),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),),const SizedBox(
          width: 22,
        ), Container(
          height: 46,
          width: 46,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
    image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT98hCxMihjMR2g9cpRTUmEt-mVc1oi1iie-VJSSmK_tnSwh6YMe1nOl1FHyvdZl-pFXa0&usqp=CAU'), fit: BoxFit.cover)
          ),
        ),
        
      ],
    ),
    ) ,
   const SizedBox(
      height: 14,
    )
    ]) ;
  }
}