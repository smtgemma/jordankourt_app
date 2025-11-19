import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/app_image.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text_field.dart';
import '../controllers/forget_password_controller.dart';
import 'forget_success.dart';

class ForgetPassConfirmView extends StatelessWidget {
  const ForgetPassConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(ForgetPasswordController());
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
              Obx(() => CustomUnderlinedTextField(
                controller: controller.forgetNewpassController,
                hintText: "New Password",
                obscureText: controller.obscurePassword.value,
                suffixIcon: controller.obscurePassword.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixTap: controller.toggleNewPassword,   // <--- FIX
              )),

              SizedBox(height: 20,),
              Obx(() => CustomUnderlinedTextField(
                controller: controller.forgetNewConpassController,
                hintText: "Enter new password again",
                obscureText: controller.obscureConPassword.value,
                suffixIcon: controller.obscureConPassword.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixTap: controller.toggleConfirmPassword,  // <--- FIX
              )),

              SizedBox(height: 30,),
              GradientButton(
                text: "Reset Password",
                onTap: (){
                  Get.to(ForgetSuccessView());
                },
              ),

            ],
          ),
        )
    );
  }
}
