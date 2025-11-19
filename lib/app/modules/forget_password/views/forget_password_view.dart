import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jordankourt_app/app/modules/forget_password/views/forget_otp.dart';

import '../../../core/constants/app_image.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text_field.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});
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

            Center(child: Image.asset(ImagePath.logo,width: 240,height: 240,)),

            const SizedBox(height: 30),
            Text('Forget Password',style: context.textTheme.titleLarge!.copyWith(
              color: Colors.white
            ),),
            SizedBox(height: 10,),
            Text('Please enter the email address linked to your account',style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white
            ),),
            SizedBox(height: 10,),
            CustomUnderlinedTextField(
              controller: controller.forgetEmailController,
              hintText: "Email",
              suffixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20,),
            GradientButton(
              text: "Enter Email",
              onTap: (){
                Get.to(ForgetOtpView());
              },
            ),

          ],
        ),
      )
    );
  }
}
