import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jordankourt_app/app/core/constants/app_colors.dart';
import 'package:pin_code/pin_code.dart';

import '../../../core/constants/app_image.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text_field.dart';
import 'forget_pass_confirm.dart';

class ForgetOtpView extends StatelessWidget {
  const ForgetOtpView({super.key});

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
              Text('Enter 4-digit Verification code',style: context.textTheme.titleLarge!.copyWith(
                  color: Colors.white
              ),),
              SizedBox(height: 10,),
              Text('Please enter the 4-digit verification code sent to your email',style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.white
              ),),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: PinCode(
                  cursorColor: AppColors.primaryColor,
                  textStyle: context.textTheme.bodyLarge!.copyWith(
                    color: Colors.white
                  ),

                  appContext: context,
                  length: 4,
                  onChanged: (value) {
                    print(value);
                  },
                  pinTheme: PinCodeTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(6),
                    fieldHeight: 50,
                    fieldWidth: 45,
                    // Colors for different states
                    activeColor: Colors.white,
                    activeFillColor: Colors.white,
                    selectedColor: AppColors.primaryColor,
                    selectedFillColor: Colors.red,
                    inactiveColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    disabledColor: Colors.grey.shade200,
                    errorBorderColor: Colors.redAccent,
                  ),
                  onCompleted: (value) {
                    print("Completed: $value");
                    // Show a dialog or navigate to the next screen
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Success"),
                        content: Text("PIN Verified: $value"),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 30,),
              GradientButton(
                text: "Enter Code",
                onTap: (){
                  Get.to(ForgetPassConfirmView());
                },
              ),

            ],
          ),
        )
    );
  }
}
