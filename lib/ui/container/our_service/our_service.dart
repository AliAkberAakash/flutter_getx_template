import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/base/widget/custom_app_promotion_widget.dart';
import 'package:go_share/base/widget/custom_bus_time_widget.dart';
import 'package:go_share/data/models/container/AboutUsModel.dart';
import 'package:go_share/data/models/service/ServiceModel.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/Fonts.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/utils/app_theme.dart';

import 'OurServiceController.dart';

class OurServiceView extends StatefulWidget {
  const OurServiceView({Key? key}) : super(key: key);

  @override
  _OurServiceViewState createState() => _OurServiceViewState();
}

class _OurServiceViewState extends State<OurServiceView> {



  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(),
            Expanded(
              child: BodyWidget(),
            ),
          ],
        ),
      ),
    );
  }


}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_two.png"),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.our_service_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.our_service_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make18xw400Style(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  int status = 0;
  OurServiceController controller =new OurServiceController();
  CoreTheme coreTheme=new CoreTheme();
  List<ServiceData> morningData = List<ServiceData>.empty(growable: true);
  List<ServiceData> eveningData = List<ServiceData>.empty(growable: true);


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: FutureBuilder<ServiceModel>(
        future: getService(),
        builder: (context, snapshot) {

          if(snapshot.hasData){
            filterData(snapshot);
            return Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          SessionWidget(
                            index: 0,
                            imagePath: "images/ic_morning.png",
                            title: GSStrings.morning,
                            isSelected: status == 0,
                            onClick: (index){
                              setState(() {
                                status = index;
                              });
                            },
                          ),
                          SizedBox(width: 16.0),
                          SessionWidget(
                            index: 1,
                            imagePath: "images/ic_evening.png",
                            title: GSStrings.evening,
                            isSelected: status == 1,
                            onClick: (index){
                              setState(() {
                                status = index;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                   Container(
                      height:  MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,

                      child: status==0?getFilterMorningServiceList(snapshot,status):getFilterEveningServiceList(snapshot,status)
                    ),

                  /*CustomBusTimeWidget(
                    backgroundImagePath: "images/ic_demo_bus_hour_two.png",
                  ),*/
                  //CustomAppPromotionWidget(data: new AboutUsModel(data: data),), //TODO:: roni comment out
                ],
              ),
            );
          }

          return coreTheme.appProgressIndicator(context);


        }
      ),
    );
  }

  Future<ServiceModel> getService() async{

    var response = await controller.FaqServiceProvider();
    print("response${response.data}");
    return response;

    // if(response != null) {
    //
    // }
    // else{
    //   new AboutUsModel(data:new List());
    // }
  }

  Widget getFilterMorningServiceList(AsyncSnapshot<ServiceModel> snapshot, int status) {
    if(morningData.isEmpty){
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 500,
                  width: 200,
                  child: Center(child: Text("No Evening Service Today"))),
            ],
          ));
    } else{
      return  ListView.builder(
          itemCount:status==0?morningData.length:eveningData.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomBusTimeWidget(
                backgroundImagePath: "images/ic_demo_bus_hour_one.png",
                title: status==0?morningData[i].title:eveningData[i].title,
                subtitle: status==0?morningData[i].subTitle:eveningData[i].subTitle,
                moneyOne: status==0?morningData[i].pricingOne.value.toString():eveningData[i].pricingOne.value.toString(),
                moneyTwo:status==0?morningData[i].pricingTwo.value.toString():eveningData[i].pricingTwo.value.toString(),
                moneyThree: status==0?morningData[i].pricingThree.value.toString():eveningData[i].pricingThree.value.toString(),
                distanceOne: status==0?morningData[i].pricingOneDistance:eveningData[i].pricingOneDistance,
                distanceTwo: status==0?morningData[i].pricingTwoDistance:eveningData[i].pricingTwoDistance,
                distanceThree: status==0?morningData[i].pricingThreeDistance:eveningData[i].pricingThreeDistance,
              ),
            );
          }
      );
    }

  }
  Widget getFilterEveningServiceList(AsyncSnapshot<ServiceModel> snapshot, int status) {

    if(eveningData.isEmpty){
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 500,
                  width: 200,
                  child: Center(child: Text("No Evening Service Today"))),
            ],
          ));
    }
    else{
      return  ListView.builder(
          itemCount:status==0?morningData.length:eveningData.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomBusTimeWidget(
                backgroundImagePath: "images/ic_demo_bus_hour_one.png",
                title: status==0?morningData[i].title:eveningData[i].title,
                subtitle: status==0?morningData[i].subTitle:eveningData[i].subTitle,
                moneyOne: status==0?morningData[i].pricingOne.value.toString():eveningData[i].pricingOne.value.toString(),
                moneyTwo:status==0?morningData[i].pricingTwo.value.toString():eveningData[i].pricingTwo.value.toString(),
                moneyThree: status==0?morningData[i].pricingThree.value.toString():eveningData[i].pricingThree.value.toString(),
                distanceOne: status==0?morningData[i].pricingOneDistance:eveningData[i].pricingOneDistance,
                distanceTwo: status==0?morningData[i].pricingTwoDistance:eveningData[i].pricingTwoDistance,
                distanceThree: status==0?morningData[i].pricingThreeDistance:eveningData[i].pricingThreeDistance,
              ),
            );
          }
      );
    }

  }

  void filterData(AsyncSnapshot<ServiceModel> snapshot) {
    for (int i=0;i<snapshot.data!.data.length;i++){
      if (snapshot.data!.data[i].serviceType=="Morning"){
        morningData.add(snapshot.data!.data[i]);
      }else{
        eveningData.add(snapshot.data!.data[i]);
      }
    }
  }
}

class SessionWidget extends StatelessWidget {
  final String title, imagePath;
  final bool isSelected;
  final int index;
  final Function(int index) onClick;

  const SessionWidget({
    Key? key,
    this.imagePath = "images/ic_morning.png",
    this.title = GSStrings.morning,
    required this.isSelected,
    required this.index,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(index);
      },
      child: Container(
        width: 112.0,
        height: 32.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
          color: isSelected ? GSColors.green_secondary : GSColors.gray_normal.withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              this.imagePath,
              height: 18.0,
              fit: BoxFit.contain,
              color: isSelected ? Colors.white :  GSColors.green_secondary,
            ),
            SizedBox(width: 6.0),
            Text(
              this.title,
              textAlign: TextAlign.start,
              style: GSTextStyles.make15xw600Style(
                color: isSelected ? Colors.white :  GSColors.green_secondary,
                fontFamily: GSFonts.appFont,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
