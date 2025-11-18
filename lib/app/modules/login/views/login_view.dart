import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/constants/app_image.dart';

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
        // flexibleSpace: Padding(
        //   padding: const EdgeInsets.only(left: 20.0, top: 70.0),
        //   child: Row(
        //     children: [
        //       GestureDetector(
        //         onTap: controller.goBack,
        //         child: Row(
        //           children: [
        //             SizedBox(
        //               width: 24,
        //               height: 24,
        //               child: SvgPicture.asset(
        //                 'assets/logos/back_arrow.svg',
        //                 width: 24,
        //                 height: 24,
        //                 fit: BoxFit.contain,
        //               ),
        //             ),
        //             const SizedBox(width: 8),
        //             const Text(
        //               'Back',
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.w500,
        //                 height: 1.5,
        //                 letterSpacing: 0,
        //                 fontFamily: 'Poppins',
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Logo illustration
              // SvgPicture.asset(
              //   'assets/svg/jordankourt_logo.svg',
              //   width: 240,
              //   height: 240,
              //   fit: BoxFit.contain,
              // ),
              Image.asset(ImagePath.logo,width: 240,height: 240,),

              const SizedBox(height: 40),

              // Login / Register tabs
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {}, // Already on login
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1.5,
                              letterSpacing: 0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 2,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.navigateToRegister,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade400,
                              height: 1.5,
                              letterSpacing: 0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 2,
                            width: double.infinity,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Email field
              TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email,color: Colors.white,),

                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: 0,
                    fontFamily: 'Poppins',
                  ),
                  //border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),


              const SizedBox(height: 20),
              ///password
              TextField(
                controller: controller.passwordController,
                obscureText: controller.obscurePassword.value,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.visibility,color: Colors.white,),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: 0,
                    fontFamily: 'Poppins',
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      )
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),




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
                                  ? Colors.orange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: controller.rememberMe.value
                                    ? Colors.orange
                                    : Colors.grey.shade400,
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
                        color: Color(0xFFFF6B6B),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.3,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
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
                    Text('Sign Up with Google',style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white
                    ),)
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Terms checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: controller.agreeTerms.value
                                ? Colors.black
                                : Colors.grey.shade400,
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

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
