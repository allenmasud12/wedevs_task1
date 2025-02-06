import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedevs_ui1/app/extension.dart';
import 'package:wedevs_ui1/resources/colour_manager.dart';

import 'resources/assets_manager.dart';
import 'resources/font_manager.dart';
import 'resources/string_manager.dart';
import 'resources/style_manager.dart';
import 'resources/value_manager.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8 ),
        child: Column(
          children: [
            15.height,
           _customAppBar(),
            _infoCard(),
            20.height,
            _boxSection(),
            20.height,
            _latterSection()
          ],
        ),
      ),
    );
  }

  Widget _customAppBar(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Name: ${AppString.name}",
          style: getTextStyle(
            FontSize.s16,
            FontWeightManager.bold,
            ColorManager.regular,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: AppSize.s24,
              child: SvgPicture.asset(ImageAssets.location),
            ),
            8.width,
            Text(AppString.location,style: getTextStyle(
              FontSize.s16,
              FontWeightManager.bold,
              ColorManager.regular
            ), ),
          ],
        )
      ],
    );
  }

  Widget _infoCard(){
    return Row(
      children: [
        const CustomInfoCard(title: AppString.endInto, name: AppString.name, address: AppString.endAddress),
        10.width,
        const CustomInfoCard(title: AppString.startInto, name: AppString.name, address: AppString.startAddress),
      ],
    );
  }

  Widget _boxSection(){
    return const SizedBox(
      height: AppSize.s150,
      child: Row(
        children: [
          Expanded(child: CustomBox(color: ColorManager.orange)),
          Expanded(child: CustomBox(color: ColorManager.purple)),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(child: CustomBox(color: ColorManager.primary)),
                Expanded(child: CustomBox(color: ColorManager.orange)),
                Expanded(child: CustomBox(color: ColorManager.blue)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(child: CustomBox(color: ColorManager.secondary)),
                Expanded(child: CustomBox(color: ColorManager.regular)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _latterSection(){
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LatterContainer(
          latter: ["A", "B", "C"],
          color: ColorManager.secondary,
        ),
        LatterContainer(
          latter: ["D", "E", "F"],
          color: ColorManager.primary,
        ),
      ],
    );
  }
}


class CustomInfoCard extends StatelessWidget {
  final String title;
  final String name;
  final String address;

  const CustomInfoCard({
    super.key,
    required this.title,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 120,
        child: Card(
          color: ColorManager.gray300,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s8)),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: getTextStyle(FontSize.s16, FontWeightManager.semiBold, ColorManager.blue)),
                Text(name, style: getTextStyle(FontSize.s14, FontWeightManager.medium, ColorManager.regular)),
                Text(address, style: getTextStyle(FontSize.s14, FontWeightManager.regular, ColorManager.regular)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CustomBox extends StatelessWidget {
  final Color color;

  const CustomBox({super.key, required this.color, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: ColorManager.regular, width: AppSize.s_5),
      ),
    );
  }
}


class LatterContainer extends StatelessWidget {
  final List<String> latter;
  final Color color;

  const LatterContainer({
    super.key,
    required this.latter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: ColorManager.regular),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s50, vertical: AppSize.s20),
        child: Column(
          children: latter
              .map(
                (text) => Text(
              text,
              style: getTextStyle(FontSize.s20, FontWeightManager.bold, ColorManager.regularWhite)
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}