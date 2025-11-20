import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/constants/app_image.dart';
import 'package:jordankourt_app/app/modules/chat/views/chat_view.dart';
import 'package:jordankourt_app/app/modules/guide/views/guide_view.dart';
import 'package:jordankourt_app/app/modules/home/views/home_view.dart';
import 'package:jordankourt_app/app/modules/shop/views/shop_view.dart';
import 'package:jordankourt_app/app/modules/vin/views/vin_view.dart';
import 'package:jordankourt_app/app/modules/workshop/views/workshop_view.dart';

import '../../profile/views/profile_view.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Map<String, dynamic>> navItems = [
    {
      'selectedIcon': SvgImagePath.homeFill,
      'unselectedIcon': SvgImagePath.home,
      'label': 'Home'
    },
    {
      'selectedIcon': SvgImagePath.chatFill,
      'unselectedIcon': SvgImagePath.chat,
      'label': 'Chat'
    },
    {
      'selectedIcon': SvgImagePath.guideFill,
      'unselectedIcon': SvgImagePath.guide,
      'label': 'Guides'
    },
    {
      'selectedIcon': SvgImagePath.shopFill,
      'unselectedIcon': SvgImagePath.shop,
      'label': 'Shop'
    },
    {
      'selectedIcon': SvgImagePath.workshopFill,
      'unselectedIcon': SvgImagePath.workshop,
      'label': 'Workshop'
    },
    {
      'selectedIcon': SvgImagePath.vinFill,
      'unselectedIcon': SvgImagePath.vin,
      'label': 'VIN'
    },
    {
      'selectedIcon': SvgImagePath.profile,
      'unselectedIcon': SvgImagePath.profileFill,
      'label': 'Profile'
    },
  ];

  final List<Map<String, dynamic>> navItemss = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.chat_bubble_outline, 'label': 'Chat'},
    {'icon': Icons.menu_book, 'label': 'Guides'},
    {'icon': Icons.shopping_cart_outlined, 'label': 'Shop'},
    {'icon': Icons.location_on_outlined, 'label': 'Workshop    '},
    {'icon': Icons.local_shipping_outlined, 'label': 'VIN'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  // Add your pages here
  final List<Widget> pages = [
    HomeView(),
    ChatView(),
    GuideView(),
    ShopView(),
   WorkshopView(),
    VinView(),
    ProfileView()
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}