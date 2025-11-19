import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/app_image.dart';
import '../../../core/widget/custom_button.dart';

class ForgetSuccessView extends StatelessWidget {
  const ForgetSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: CircleAvatar(
              backgroundColor: Color(0xffF8F8F8).withOpacity(.1),
              child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
            ),
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Center(child: Image.asset(ImagePath.check,width: 240,height: 240,)),

              const SizedBox(height: 20),
              Text('Password reset successful',style: context.textTheme.titleLarge!.copyWith(
                  color: Colors.white
              ),),
              SizedBox(height: 10,),
              Text('You have successfully reset your password. Please use this new password when you log in again.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.white
              ),),
              SizedBox(height: 10,),

              SizedBox(height: 20,),
              GradientButton(
                text: "Continue",
                onTap: (){
                 // Get.to(ForgetOtpView());
                },
              ),

            ],
          ),
        )
    );
  }
}
