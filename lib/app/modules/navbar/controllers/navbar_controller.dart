import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/constants/app_image.dart';

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
      'selectedIcon': SvgImagePath.profileFill,
      'unselectedIcon': SvgImagePath.profile,
      'label': 'Profile'
    },
  ];

  final List<Map<String, dynamic>> navItemss = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.chat_bubble_outline, 'label': 'Chat'},
    {'icon': Icons.menu_book, 'label': 'Guides'},
    {'icon': Icons.shopping_cart_outlined, 'label': 'Shop'},
    {'icon': Icons.location_on_outlined, 'label': 'Worksho...'},
    {'icon': Icons.local_shipping_outlined, 'label': 'VIN'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  // Add your pages here
  final List<Widget> pages = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Chat Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Guides Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Shop Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Workshop Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('VIN Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}