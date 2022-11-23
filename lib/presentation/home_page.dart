import 'dart:convert';
import 'package:fitness_app/presentation/widgets/GoalsDataModel.dart';
import 'package:fitness_app/resources/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../resources/strings.dart';
import '../resources/text_styles.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(
                 Strings.activity,
                 style: TextStyles.textStylePoppins18(color: Colors.black),
                 textAlign:TextAlign.right
                ,),
            Text(
                 Strings.activity1,
                 style: TextStyles.textStylePoppins14(color: CustomColors.easternBlue),
                 textAlign:TextAlign.right),
          ],
        ),
        backgroundColor: CustomColors.lotion,
        elevation: 0.0,
      ),
          body: FutureBuilder(
            future: ReadJsonData(),
            builder: (context,data){
              if(data.hasError){
                return Center(child: Text("${data.error}"));
              }else if(data.hasData){
                JsonModel items = data.data;
                //var items = data.data as List<GoalsDataModel>; //items contine toata informatia din json file
               // var items1 = data.data as List<DailyExerciseModel>;
                return Column(
                  children: [
                    Flexible(
                  child:Container(
                  height:276,
                  child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  itemCount: items.goals == null ? 0:items.goals.length,
                  itemBuilder: (context, index){
                    return Card(
                      elevation:0,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        //margin: EdgeInsets.(5),
                        height:276,
                        width:310,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Colors.white,
                          boxShadow:[
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ]
                        ),

                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image(
                                  width:310,
                                  image:NetworkImage(items.goals[index].cover.toString()),height: 144,fit:BoxFit.cover),
                                )
                            ),
                            Positioned(
                                  left:12,
                                  top:160,
                                  child:Text(items.goals[index].title.toString(),style:TextStyles.textStylePoppins24(color:Colors.black)),
                            ),
                            Positioned(
                              left:12,
                              top:196,
                              child:Text(items.goals[index].sub_title.toString(),style:TextStyles.textStylePoppins14M(color:CustomColors.grannySmith),
                            )),
                            Positioned(
                                left:226,
                                top:104,
                                child: SvgPicture.asset('resources/svg/play.svg'),
                                ),
                            Positioned(
                              left:12,
                              bottom:16,
                              child: Container(
                                height:32,
                                width:85,
                                decoration: BoxDecoration(
                                  color: CustomColors.sugarCane, // border color
                                  shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: CustomColors.christi,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(16))
                                ),
                              ),
                            ),
                            Positioned(
                              left:22,
                              top:225,
                              child: SvgPicture.asset('resources/svg/time.svg'),
                            ),
                            Positioned(
                                left:40,
                                top:224,
                                child:Text((items.goals[index].duration_seconds!/3600).toStringAsFixed(1),style:TextStyles.textStylePoppins14M(color:CustomColors.christi),
                                )),
                            Positioned(
                                left:62,
                                top:224,
                                child:Text('hour',style:TextStyles.textStylePoppins14M(color:CustomColors.christi),
                                )),
                            Positioned(
                              left:113,
                              bottom:16,
                              child: Container(
                                height:32,
                                width:85,
                                decoration: BoxDecoration(
                                    color: CustomColors.islandSpice, // border color
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: CustomColors.selectiveYellow,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(16))
                                ),
                              ),
                            ),
                            Positioned(
                              left:124,
                              top:225,
                              child: SvgPicture.asset('resources/svg/calories.svg'),
                            ),
                            Positioned(
                                left:141,
                                top:224,
                                child:Text(items.goals[index].calories_count.toString(),style:TextStyles.textStylePoppins14M(color:CustomColors.selectiveYellow),
                                )),
                            Positioned(
                                left:168,
                                top:224,
                                child:Text('cal',style:TextStyles.textStylePoppins14M(color:CustomColors.selectiveYellow),
                                )),
                           ],
                        )

                      )

                    );
                  },
                ),
                  )
                    ),
                     Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
                         child: Container(
                       height: 50,
                         child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children:[
                            Text(
                            Strings.activity2,
                              style: TextStyles.textStylePoppins18(color: Colors.black),
                               textAlign:TextAlign.right
                             ,),
                           Text(
                               Strings.activity1,
                               style: TextStyles.textStylePoppins14(color: CustomColors.easternBlue),
                               textAlign:TextAlign.right),
                            ],)))),
                    Flexible(child:Container(
                      width: 358,
                      child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: items.exercise.length == null ? 0:items.exercise.length,
                      itemBuilder: (context, index){
                        return Card(
                            elevation:0,
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            child: Container(
                                height:48,
                                width:358,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        child:ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image(
                                              width:48,
                                              image:NetworkImage(items.exercise[index].cover.toString()),height: 48,fit:BoxFit.cover),
                                        )
                                    ),
                                    Positioned(
                                        left:80,
                                        top:0,
                                        child:Text(items.exercise[index].title.toString(),style:TextStyles.textStylePoppins16(color:Colors.black),
                                        )),
                                    Positioned(
                                      left:82,
                                      bottom:2,
                                      child: SvgPicture.asset('resources/svg/time.svg'),
                                    ),
                                    Positioned(
                                        left:100,
                                        bottom:1,
                                        child:Text((items.exercise[index].duration_seconds!/60).toStringAsFixed(1),style:TextStyles.textStylePoppins14M(color:CustomColors.christi),
                                        )),
                                    Positioned(
                                        left:125,
                                        bottom:1,
                                        child:Text('min',style:TextStyles.textStylePoppins14M(color:CustomColors.christi),
                                        )),
                                    Positioned(
                                      left:167,
                                      bottom:2,
                                      child: SvgPicture.asset('resources/svg/calories.svg'),
                                    ),
                                    Positioned(
                                        left:183,
                                        bottom:1,
                                        child:Text(items.exercise[index].calories_count.toString(),style:TextStyles.textStylePoppins14M(color:CustomColors.selectiveYellow),
                                        )),
                                    Positioned(
                                        left:210,
                                        bottom:1,
                                        child:Text('cal',style:TextStyles.textStylePoppins14M(color:CustomColors.selectiveYellow),
                                        )),
                                    Positioned(
                                      right:16,
                                      top: 6,
                                      child: SvgPicture.asset('resources/svg/play2.svg'),
                                    ),
                        ])
                            )
                        );
                      }
                            )
                            )
                    )
                            ]
              );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
          ),
    );
  }
    Future ReadJsonData() async {
    String jsonString =
    await rootBundle.rootBundle.loadString('resources/files/assets1.json');
    final jsonResponse = json.decode(jsonString);
    JsonModel four = new JsonModel.fromJson(jsonResponse);
    return four;
    }
}

