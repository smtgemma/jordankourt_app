import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/constants/app_colors.dart';
import 'package:jordankourt_app/app/core/constants/app_image.dart';
import 'package:jordankourt_app/app/routes/app_pages.dart';

import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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

            Image.asset(ImagePath.logo,width: 240,height: 240,),

            const SizedBox(height: 30),

            ///Tabbar
            TabBar(
             // padding: EdgeInsets.symmetric(horizontal: 15),
              dividerColor: Color(0xff6C7278),
              labelStyle: context.textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: context.textTheme.bodyLarge!.copyWith(
                color:Colors.white,
                fontWeight: FontWeight.w500,
              ),
              indicator: BoxDecoration(

                border: Border(
                  bottom: BorderSide(
                   // color: Color(0xff1E546E),
                    color: Colors.white,
                    width: 2,
                  ), // divider line
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: controller.tabController,
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Register'),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: TabBarView(
                  controller: controller.tabController,
                  children: [

                    ///login
                    Column(
                      children: [
                        // Email field
                        CustomUnderlinedTextField(
                          controller: controller.loginEmailController,
                          hintText: "Email",
                          suffixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        const SizedBox(height: 20),
                        ///password

                        Obx(() => CustomUnderlinedTextField(
                          controller: controller.loginPasswordController,
                          hintText: "Password",
                          obscureText: controller.obscureLoginPassword.value,
                          suffixIcon: controller.obscureLoginPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onSuffixTap: controller.toggleLoginPassword,  // <--- FIX
                        )),


                        const SizedBox(height: 16),

                        // Error message
                        Obx(
                              () => controller.errorMessage.value.isNotEmpty
                              ? Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.errorMessage.value,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFFF6B6B),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          )
                              : const SizedBox.shrink(),
                        ),

                        // Remember me & Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                      () => GestureDetector(
                                    onTap: () => controller.toggleRememberMe(
                                      !controller.rememberMe.value,
                                    ),
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: controller.rememberMe.value
                                            ? AppColors.primaryColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: controller.rememberMe.value
                                              ? AppColors.primaryColor
                                              : AppColors.primaryColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: controller.rememberMe.value
                                          ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      )
                                          : null,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: controller.forgotPassword,
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Login button
                        GradientButton(
                          text: "Login",
                          //onTap: controller.login,
                          onTap: (){
                            Get.toNamed(Routes.NAVBAR);
                          },
                        ),

                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.white
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SvgImagePath.google),
                              SizedBox(width: 10,),
                              Text('Sign Up with Google',style: context.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white
                              ),)
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Terms checkbox
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                    () => GestureDetector(
                                  onTap: () => controller.toggleAgreeTerms(
                                    !controller.agreeTerms.value,
                                  ),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: BoxDecoration(
                                      color: controller.agreeTerms.value
                                          ? AppColors.primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: controller.agreeTerms.value
                                            ? AppColors.primaryColor
                                            : AppColors.primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: controller.agreeTerms.value
                                        ? const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Colors.white,
                                    )
                                        : null,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Text(
                                  'By using “Truckfix AI” you agree to our terms.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),


                    ///Register
                    Column(
                      children: [
                        // Name
                        CustomUnderlinedTextField(
                          controller: controller.registerNameController,
                          hintText: "Name",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 10,),
                        // Email field
                        CustomUnderlinedTextField(
                          controller: controller.registerEmailController,
                          hintText: "Email",
                          suffixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),



                        const SizedBox(height: 20),

                        ///password

                        Obx(() => CustomUnderlinedTextField(
                          controller: controller.registerPasswordController,
                          hintText: "Enter new password again",
                          obscureText: controller.obscureRegisterPassword.value,
                          suffixIcon: controller.obscureRegisterPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onSuffixTap: controller.toggleRegisterPassword,  // <--- FIX
                        )),







                        const SizedBox(height: 16),

                        // Error message
                        Obx(
                              () => controller.errorMessage.value.isNotEmpty
                              ? Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.errorMessage.value,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFFF6B6B),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          )
                              : const SizedBox.shrink(),
                        ),

                        // Remember me & Forgot password


                        const SizedBox(height: 24),

                        /// Register button


                        GradientButton(
                          text: "Register",
                          onTap: controller.login,
                        ),




                        const SizedBox(height: 20),

                        // Terms checkbox
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                    () => GestureDetector(
                                  onTap: () => controller.toggleAgreeTerms(
                                    !controller.agreeTerms.value,
                                  ),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: BoxDecoration(
                                      color: controller.agreeTerms.value
                                          ? AppColors.primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: controller.agreeTerms.value
                                            ? Colors.black
                                            : AppColors.primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: controller.agreeTerms.value
                                        ? const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Colors.white,
                                    )
                                        : null,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                               Expanded(
                                child: Text(
                                  'By using “Truckfix AI” you agree to our terms.',
                                  style: context.textTheme.labelMedium!.copyWith(
                                    color: Colors.white
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
