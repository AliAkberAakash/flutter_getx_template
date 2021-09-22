import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/data/models/container/contactus/FaqModel.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/book_a_bus/book_a_bus.dart';
import 'package:go_share/ui/container/faq/FaqController.dart';
import 'package:go_share/ui/container/lost_and_found/lost_and_found.dart';
import 'package:go_share/ui/container/our_service/our_service.dart';
import 'package:go_share/ui/container/privacy_and_concern/privacy_and_concern.dart';
import 'package:go_share/ui/container/terms_and_conditions/terms_and_conditions.dart';

class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {

  FaqController controller=new FaqController();

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
            Expanded(
              flex: 0,
                child: TitleWidget()),
            Expanded(
              flex: 1,
              child: FutureBuilder<FaqModel>(
                future: getFaqData(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return FaqListWidget(data:snapshot.data);

                  }
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: CircularProgressIndicator()));

                }
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<FaqModel> getFaqData() async{

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
                GSStrings.faq_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.faq_subtitle,
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

class FaqListWidget extends StatelessWidget {
  FaqModel? data;
  FaqListWidget({required this.data});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: data!.data.length,
        itemBuilder: (context,i){

          Widget nextPage = BookABusView(data: data,categoryId:data!.data[i].category.id,name :data!.data[i].category.name);
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: FaqItemWidget(
              title: data!.data[i].category.name,
              nextPage: nextPage,
          ),
           );

    }
    );
    /*return ListView.separated(

      padding: const EdgeInsets.symmetric(vertical: 30.0),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        String title = "Billing";
        Widget nextPage = BookABusView();

        switch (index) {
          case 0:
            title = "Billing";
            nextPage = BookABusView();
            break;

          case 1:
            title = "Billing";
            nextPage = BookABusView();
            break;

          case 2:
            title = "Billing";
            nextPage = BookABusView();
            break;

          case 3:
            title = "Billing";
            nextPage = BookABusView();
            break;

          case 4:
            title = "Billing";
            nextPage = BookABusView();
            break;
        }

        return FaqItemWidget(
          title: title,
          nextPage: nextPage,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 20.0);
      },
      itemCount: 5,
    );*/
  }
}

class FaqItemWidget extends StatelessWidget {
  final String title;
  final Widget nextPage;

  const FaqItemWidget({
    Key? key,
    required this.title,
    required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => this.nextPage,
            ),
          );
        },
        borderRadius: const BorderRadius.all(
          const Radius.circular(4.0),
        ),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          decoration: BoxDecoration(
            color: GSColors.green_secondary.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              const Radius.circular(4.0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.help_outline,
                color: GSColors.green_secondary,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    this.title,
                    style: GSTextStyles.make15xw600Style(
                      color: GSColors.green_secondary,
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: GSColors.green_secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
