import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:itcity_online_store/api/models/HomeAds.dart';
import 'package:itcity_online_store/api/models/category.dart';
import 'package:itcity_online_store/api/models/customer_wishlist.dart';
import 'package:itcity_online_store/api/models/home_images.dart';
import 'package:itcity_online_store/api/models/product.dart';
import 'package:itcity_online_store/blocs/blocs.dart';
import 'package:itcity_online_store/components/FeaturedProduct.dart';
import 'package:itcity_online_store/components/PopularProducts.dart';
import 'package:itcity_online_store/components/category_card.dart';

import 'package:itcity_online_store/components/components.dart';
import 'package:itcity_online_store/components/computer_collections.dart';
import 'package:itcity_online_store/components/home_ads_banner.dart';

import 'package:itcity_online_store/components/mobile_collections.dart';
import 'package:itcity_online_store/resources/values.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/home_products.dart';

class HomePageContentNew extends StatefulWidget {
  @override
  _HomePageContentNewState createState() => _HomePageContentNewState();
}

class _HomePageContentNewState extends State<HomePageContentNew> {
  List<Product> featuredproducts = [];
  List<Product> popularproducts = [];
  List<CustomerWishlist> wishlist = [];
  List<Product> mobileCollections = [];
  List<HomeAds>? homeAdImages;
  List<HomeImages>? homeImages;
  late SharedPreferences prefs;

  //HomeAds
  HomeAds accessories = HomeAds();
  HomeAds computer = HomeAds();
  HomeAds mobile = HomeAds();
  HomeAds tab = HomeAds();
  HomeAds homeAppliance = HomeAds();
  HomeAds watch = HomeAds();
  HomeAds bag = HomeAds();
  HomeAds personalCare = HomeAds();
  HomeAds camera = HomeAds();
  HomeAds gaming = HomeAds();
  List<Category>? categoryList = [];

  ScrollController _scrollDirection = ScrollController();
  bool _notDone = false;

  bool isCommon = false;
  void initPref() async {
    prefs = await SharedPreferences.getInstance();
    // BlocProvider.of<HomeBloc>(context)
    //     .add(FetchFeaturedProduct(prefs.getString('currency')));
    // BlocProvider.of<HomeBloc>(context)
    //     .add(FetchPopularProduct(prefs.getString('currency')));
    BlocProvider.of<HomeBloc>(context)
        .add(FetchMobileCollections(prefs.getString('currency')));
    // if (prefs.containsKey("email")) {
    //   BlocProvider.of<WishlistBloc>(context)
    //       .add(FetchWishlistEvent(prefs.getString("email"),));
    // } else {
    //   BlocProvider.of<WishlistBloc>(context).add(FetchWishlistEvent(" "));
    // }
  }

  @override
  void initState() {
    initPref();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<HomeBloc>(context).state is HomeInitial) {}
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        //fetchHomeimages
        //homeImages = BlocProvider.of<HomeBloc>(context).image;
        //featuredproducts = BlocProvider.of<HomeBloc>(context).featuredProduct;
        //popularproducts = BlocProvider.of<HomeBloc>(context).popularProduct;

        wishlist = BlocProvider.of<WishlistBloc>(context).customerWishlist;
        categoryList = BlocProvider.of<CategoryBloc>(context).categoryList;
        accessories = BlocProvider.of<HomeBloc>(context).homeadsAccessory;
        computer = BlocProvider.of<HomeBloc>(context).homeadsComputer;
        mobile = BlocProvider.of<HomeBloc>(context).homeadsMobile;

        // //second half
        // tab = BlocProvider.of<HomeBloc>(context).homeadsTab;
        // homeAppliance = BlocProvider.of<HomeBloc>(context).homeadsHomeappliance;
        // watch = BlocProvider.of<HomeBloc>(context).homeadsWatch;
        // bag = BlocProvider.of<HomeBloc>(context).homeadsBag;
        // personalCare = BlocProvider.of<HomeBloc>(context).homeadsPersonalCare;
        // camera = BlocProvider.of<HomeBloc>(context).homeadsCamera;
        // gaming = BlocProvider.of<HomeBloc>(context).homeadsGaming;

        return BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state is AddProductToCartLoadingState) {
              Loader.show(context,
                  isAppbarOverlay: true,
                  isBottomBarOverlay: false,
                  progressIndicator: CircularProgressIndicator(),
                  themeData: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.black38)),
                  overlayColor: Colors.black26);
            } else if (state is AddProductToCartSuccessState) {
              Loader.hide();

              if (BlocProvider.of<CartBloc>(context)
                      .page!
                      .compareTo('cartpage') ==
                  1) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Product added to Cart",
                              style: TextStyle(fontSize: 27),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.of(context).size.height *
                                            .07,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * .35,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.WHITE),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    color: AppColors
                                                        .LOGO_ORANGE))),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.LOGO_ORANGE),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "CONTINUE SHOPPING",
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.of(context).size.height *
                                            .07,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * .35,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.LOGO_ORANGE),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    color: AppColors
                                                        .LOGO_ORANGE))),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.WHITE),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context, "/cart", (route) => false);
                                      },
                                      child: Text(
                                        "GO TO CART",
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      );
                    });
              }
            } else if (state is AddProductToCartErrorState) {
              Loader.hide();
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.clear_outlined,
                            color: AppColors.WHITE,
                            size: 75,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Something Went Wrong",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Please Try Again Later",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                      ],
                    );
                  });
            } else {
              Loader.hide();
            }

            // TODO: implement listener
          },
          child: Container(
            //decoration: kContainerDecoration,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return NotificationListener(
                  onNotification: (ScrollNotification scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification) {
                      if (scrollNotification.scrollDelta! > 0) {
                        if (!_notDone) {
                          //second half
                          tab = BlocProvider.of<HomeBloc>(context).homeadsTab;
                          homeAppliance = BlocProvider.of<HomeBloc>(context)
                              .homeadsHomeappliance;
                          watch =
                              BlocProvider.of<HomeBloc>(context).homeadsWatch;
                          bag = BlocProvider.of<HomeBloc>(context).homeadsBag;
                          personalCare = BlocProvider.of<HomeBloc>(context)
                              .homeadsPersonalCare;
                          camera =
                              BlocProvider.of<HomeBloc>(context).homeadsCamera;
                          gaming =
                              BlocProvider.of<HomeBloc>(context).homeadsGaming;
                          setState(() {
                            _notDone = true;
                          });
                        }
                      }
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                    controller: _scrollDirection,
                    physics: ScrollPhysics(),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        children: [
                          //BannerList(),
                          CategoryCard(),
                          // new HomeAdsBanner(
                          //   imageAds: (homeAdImages == n you sure ll)
                          //       ? accessories
                          //       : homeAdImages![0],
                          // ),
                          //DailyDeals(),
                          //  HomeAdsBanner(
                          //   //index: 1,
                          //   imageAds: homeAdImages![0],
                          // ),

                          HomeAdsBanner(
                            imageAds: accessories,
                          ),

                          HomeProducts(
                              title: 'Accessories',
                              categoryId: categoryList![0]
                                  .categoryId), //PopularProducts(),
                          HomeAdsBanner(
                            imageAds: computer,
                          ),
                          HomeProducts(
                              title: 'Computer Collections',
                              categoryId: categoryList![1].categoryId),
                          //ComputerCollections(),
                          HomeAdsBanner(
                            imageAds: mobile,
                          ),
                          //MobileCollections(),
                          HomeProducts(
                              title: 'Mobile Collections',
                              categoryId: categoryList![2].categoryId),
                          HomeAdsBanner(
                            imageAds: tab,
                          ),
                          HomeProducts(
                              title: 'Tablets Collections',
                              categoryId: categoryList![3].categoryId),
                          HomeAdsBanner(
                            imageAds: homeAppliance,
                          ),
                          HomeProducts(
                              title: 'Home Appliances',
                              categoryId: categoryList![4]
                                  .categoryId), //FeaturedProduct(),
                          HomeAdsBanner(
                            imageAds: watch,
                          ),
                          HomeProducts(
                              title: 'Watches \& Perfumes',
                              categoryId: categoryList![5].categoryId),
                          HomeAdsBanner(
                            imageAds: bag,
                          ),
                          HomeProducts(
                              title: 'Travel Bags',
                              categoryId: categoryList![6].categoryId),
                          HomeAdsBanner(
                            imageAds: personalCare,
                          ),
                          HomeProducts(
                              title: 'Personal Care Collections',
                              categoryId: categoryList![7].categoryId),
                          HomeAdsBanner(
                            imageAds: camera,
                          ),
                          HomeProducts(
                              title: 'Cameras \& Drones',
                              categoryId: categoryList![8].categoryId),
                          HomeAdsBanner(
                            imageAds: gaming,
                          ),
                          HomeProducts(
                              title: 'Gaming Collections',
                              categoryId: categoryList![10].categoryId),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

var date = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String formattedDate = formatter.format(date);
var dateParse = DateTime.parse(formattedDate);
var formatted = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
final eventTime = DateTime.parse('${formattedDate.toString()} 24:00:00');

class _TimerAppState extends State<TimerApp> {
  static const duration = const Duration(seconds: 1);
  int timeDiff = eventTime.difference(DateTime.now()).inSeconds;
  bool isActive = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    // setState(() {
    isActive = !isActive;
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void handleTick() {
    if (timeDiff > 0) {
      if (isActive) {
        if (mounted) {
          setState(() {
            if (eventTime != DateTime.now()) {
              timeDiff = timeDiff - 1;
            } else {}
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      // color: Colors.orange[500],
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LabelText(
                    label: 'HRS', value: hours.toString().padLeft(2, '0')),
                LabelText(
                    label: 'MIN', value: minutes.toString().padLeft(2, '0')),
                LabelText(
                    label: 'SEC', value: seconds.toString().padLeft(2, '0')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value $label ',
      style: TextStyle(
          color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}
