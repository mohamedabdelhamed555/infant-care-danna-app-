import 'package:flutter/material.dart';
import 'package:graduation/models/service_model.dart';
import 'package:graduation/screens/posts/posts_screen.dart';
import 'package:graduation/screens/proooduct/prooduct_screen.dart';
import 'package:graduation/widget/map/map_screen.dart';
import 'package:graduation/widget/home/service_container.dart';
import 'package:graduation/widget/video/join_call.dart';

class ServiceGrid extends StatelessWidget {
  ServiceGrid({
    super.key,
  });
  final List<ServiceModel> services = [
    const ServiceModel(
      title: "Find Incubation",
      subTitle: "Incubators for Babies",
      imagePath: "assets/images/unsplash_akPctn2G0jM.png",
      titleColor: Colors.white,
      subTitleColor: Color(0xffCEEBE4),
      containerColor: Color(0xff32AA90),
      circleColor: Color(0xffBCBCBC),
      screen: MapScreen(),
    ),
    const ServiceModel(
      title: "Community",
      subTitle: "Parent Community",
      imagePath: "assets/images/mum&baby.png",
      titleColor: Colors.black,
      subTitleColor: Colors.black87,
      containerColor: Colors.white,
      circleColor: Color(0xffBCBCBC),
      screen: postScreen(),
    ),
    const ServiceModel(
      title: "Products",
      subTitle: "For Every Needs",
      imagePath: "assets/images/supermarket.png",
      titleColor: Colors.black,
      subTitleColor: Colors.black87,
      containerColor: Colors.white,
      circleColor: Color(0xffBCBCBC),
      screen: ProductScreen(),
    ),
    const ServiceModel(
      title: "Video Call",
      subTitle: "Connect With Doctor",
      imagePath: "assets/images/hands.png",
      titleColor: Colors.black,
      subTitleColor: Colors.black87,
      containerColor: Colors.white,
      circleColor: Color(0xffBCBCBC),
      screen: JoinCall(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.99,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ServiceContainer(service: services[index]);
        },
      ),
    );
  }
}
