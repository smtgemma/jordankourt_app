import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/constants/app_image.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,

        title:ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36'),
          ),
          title: Text('Cameron William',style: context.textTheme.bodySmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),),
          subtitle: Text('Good Morning ',style: context.textTheme.labelLarge!.copyWith(
            color: Color(0xffDBDBDB)
          ),),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){}, icon:Icon(Icons.notifications_none_outlined,color: Colors.white,) ),
              Positioned(
                top: 8.h,left: 8.w,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.red,
                  child: Text('1',style: context.textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 8
                  ),),
                ),
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             // height: 80,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 11,vertical: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: [
                  Color(0xffFE6C76),
                  Color(0xffFCAF45)
                ])

              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFFA686)
                    ),
                    child: SvgPicture.asset(SvgImagePath.homeFrame),
                  ),
                  SizedBox(height: 8.h,),
                  Text('AI Assistant',style: context.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),
                  SizedBox(height: 8.h,),
                  Text('Ask AI about your truck issues',style: context.textTheme.labelLarge!.copyWith(

                      color: Colors.white
                  ),)
                ],
              ),
            ),
            SizedBox(height: 16.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 148.h,
                    padding: EdgeInsets.symmetric(horizontal: 11,vertical: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff181D3D),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(colors: [
                                Color(0xff6BF800),
                                Color(0xff3F9200)
                              ])
                          ),
                          child: SvgPicture.asset(SvgImagePath.setting),
                        ),
                        SizedBox(height: 8.h,),
                        Text('Parts',style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                        SizedBox(height: 4.h,),
                        Text('Truck tools',style: context.textTheme.labelLarge!.copyWith(

                            color: Colors.white
                        ),)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15.w,),
                Expanded(
                  child: Container(
                    height: 148.h,
                    padding: EdgeInsets.symmetric(horizontal: 11,vertical: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff181D3D),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(colors: [
                                Color(0xff3701D9),
                                Color(0xff1D0173)
                              ])
                          ),
                          child: SvgPicture.asset(SvgImagePath.book),
                        ),
                        SizedBox(height: 8.h,),
                        Text('Guides',style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                        SizedBox(height: 4.h,),
                        Text('Maintenance Tips',style: context.textTheme.labelLarge!.copyWith(
                            color: Colors.white
                        ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Text('Recent Activity',style: context.textTheme.labelLarge!.copyWith(
                color: Colors.white
            ),),
            SizedBox(height: 10.h,),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context,index){
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFFFFFF).withOpacity(.14)
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0xffFFFFFF0D).withOpacity(.15)
                      ),
                      child: SvgPicture.asset(SvgImagePath.setting),
                    ),
                    title: Text('Chat with AI Assistant',style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white
                    ),),
                    subtitle: Text('2 hours ago',style: context.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color:  Color(0xffDBDBDB)
                    ),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  )
              );
            },
                separatorBuilder: (context,index){return SizedBox(height: 10,);}, itemCount: 3)

          ],
        ),
      )
    );
  }
}
