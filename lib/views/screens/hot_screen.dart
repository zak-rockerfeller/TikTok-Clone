import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nest_reels/models/models.dart';
import 'package:nest_reels/services/repo.dart';
import 'package:nest_reels/config/palette.dart';
import 'package:nest_reels/views/screens/screens.dart';

final king = NumberFormat("#,##0", "en_US");
class HotScreen extends StatefulWidget {

  const HotScreen({Key? key}) : super(key: key);

  @override
  HotScreenState createState() => HotScreenState();
}

class HotScreenState extends State<HotScreen> {
  final TrackingScrollController _trackingScrollController = TrackingScrollController();
  List<dynamic> popularList = [];
  List<dynamic> topList = [];
  List<dynamic> newList = [];
  List<dynamic> cheapList = [];
  List<dynamic> lovelyHomesList = [];
  List<dynamic> ngongHillsList = [];
  List<dynamic> airbnbList = [];
  List<dynamic> forSaleList = [];
  List<dynamic> commercialList = [];
  List<dynamic> hotDealsList = [];
  List<dynamic> homeDecorList = [];
  List<dynamic> servicesList = [];
  List<dynamic> babyList = [];
  List<dynamic> toolsList = [];
  List<dynamic> giftsList = [];
  List<dynamic> hotelList = [];
  List<dynamic> hdList = [];
  int userId = 0;
  bool _loading = true;
  Userz? user;


  Future<void> retrieveHotelsColumn() async{
    ApiResponse response = await fetchHotelsNests();

    if(response.error == null){
      setState(() {
        hotelList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    }
    else{
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error),));
      setState(() {
        _loading = !_loading;
      });
    }
  }
  Future<void> retrieveHdColumn() async{
    ApiResponse response = await fetchHDNests();

    if(response.error == null){
      setState(() {
        hdList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    }
    else{
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error),));
      setState(() {
        _loading = !_loading;
      });
    }
  }
  Future<void> refreshHomePage() async{
    retrieveHotelsColumn();
    retrieveHdColumn();

  }

  @override
  void initState(){
    super.initState();
    retrieveHotelsColumn();
    retrieveHdColumn();
  }

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        return refreshHomePage();
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            controller: _trackingScrollController,
            slivers: [
              //Top bar
              SliverAppBar(
                leadingWidth: 50,
                leading: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                            image: AssetImage("assets/images/logo_nest.png"),
                            fit: BoxFit.scaleDown)

                    ),
                  ),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: const SizedBox(height: 75,),
                floating: true,
                actions: [
                  IconButton(
                    color: Palette.nestBlue,
                    icon: const Icon(FontAwesomeIcons.search, size: 25,),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen(),),);
                    },
                  ),
                ],
              ),

              //Hotels
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Hotels',
                        style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold,),),
                    ],
                  ),
                ),),
              SliverPadding(
                padding: const EdgeInsets.all(2),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            offset: const Offset(0.0, 1.0),
                            blurRadius: 6.0)
                      ],
                    ),
                    child: hotelList.isEmpty ?
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Center(
                          child: CircularProgressIndicator(color: Palette.nestBlue,)),
                    ) :
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hotelList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Nest hotels = hotelList[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 250.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 15.0,
                                child: Container(
                                  height: 700.0,
                                  width: 600.0,
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      offset: const Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag: hotels.id!,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 650.0,
                                          width: 550.0,
                                          image: NetworkImage(hotels.image.toString()),
                                          fit: BoxFit.cover,),
                                      ),
                                    ),
                                    Positioned(
                                      left: 2.0,
                                      bottom: 5.0,
                                      right: 2.0,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        //color: Colors.black45,
                                        decoration: BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(hotels.name!,style: const TextStyle(
                                              color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.w500,letterSpacing: 0.5,),),
                                            Row(
                                              children: [
                                                const Icon(
                                                  FontAwesomeIcons.mapMarker,
                                                  size: 15.0,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(height: 8.0),
                                                Text(' ${hotels.location} ',
                                                  style: const TextStyle(color: Colors.white, fontSize: 14.0,fontWeight: FontWeight.w400,letterSpacing: 0.3),
                                                ),
                                              ],
                                            ),
                                            Row(
                                                children: [
                                                  const Icon(
                                                    FontAwesomeIcons.moneyBill,
                                                    size: 12.0,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(height: 5.0),
                                                  Text('   Ksh ${king.format(hotels.price)} ',
                                                    style: const TextStyle(color: Colors.white, fontSize: 12.0,fontWeight: FontWeight.w400,letterSpacing: 0.6),)

                                                ]
                                            ),

                                          ],),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),),

              //Holiday Destinations
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Holiday Destinations',
                        style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold,),),
                    ],
                  ),
                ),),
              SliverPadding(
                padding: const EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 50),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            offset: const Offset(0.0, 1.0),
                            blurRadius: 6.0)
                      ],
                    ),
                    child: hdList.isEmpty ?
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Center(
                          child: CircularProgressIndicator(color: Palette.nestBlue,)),
                    ) :
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hdList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Nest hd = hdList[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 250.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 15.0,
                                child: Container(
                                  height: 700.0,
                                  width: 600.0,
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      offset: const Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag: hd.id!,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 650.0,
                                          width: 550.0,
                                          image: NetworkImage(hd.image.toString()),
                                          fit: BoxFit.cover,),
                                      ),
                                    ),
                                    Positioned(
                                      left: 2.0,
                                      bottom: 5.0,
                                      right: 2.0,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        //color: Colors.black45,
                                        decoration: BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(hd.name!,style: const TextStyle(
                                              color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.w500,letterSpacing: 0.5,),),
                                            Row(
                                              children: [
                                                const Icon(
                                                  FontAwesomeIcons.mapMarker,
                                                  size: 15.0,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(height: 8.0),
                                                Text(' ${hd.location} ',
                                                  style: const TextStyle(color: Colors.white, fontSize: 14.0,fontWeight: FontWeight.w400,letterSpacing: 0.3),
                                                ),
                                              ],
                                            ),
                                            Row(
                                                children: [
                                                  const Icon(
                                                    FontAwesomeIcons.moneyBill,
                                                    size: 12.0,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(height: 5.0),
                                                  Text('   Ksh ${king.format(hd.price)} ',
                                                    style: const TextStyle(color: Colors.white, fontSize: 12.0,fontWeight: FontWeight.w400,letterSpacing: 0.6),)

                                                ]
                                            ),

                                          ],),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),),


            ],
          ),
        ),
      ),
    );
  }
}


