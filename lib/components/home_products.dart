import 'dart:math';

import 'package:flutter/material.dart';

import 'package:itcity_online_store/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcity_online_store/api/models/models.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:itcity_online_store/components/deals_card_new.dart';
import 'package:itcity_online_store/components/list_header.dart';
import 'package:itcity_online_store/resources/values.dart';
import 'package:itcity_online_store/screens/deals_full_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/product_by_category_page.dart';

class HomeProducts extends StatefulWidget {
  // Values to be passed to the state class
  final String title;
  final int? categoryId;

  // Constructor to receive values
  const HomeProducts({
    Key? key,
    required this.title,
    required this.categoryId
  }) : super(key: key);

  @override
  _HomeProductsState createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  String? currency;
  getCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.currency = prefs.getString('currency');

    if (widget.title.contains('Tablet')) {
      BlocProvider.of<HomeBloc>(context)
          .add(TabletDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Accessories')) {
      BlocProvider.of<HomeBloc>(context)
          .add(AcessoriesDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Home')) {
      BlocProvider.of<HomeBloc>(context)
          .add(HomeApplianceDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Watch')) {
      BlocProvider.of<HomeBloc>(context)
          .add(WatchDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Bag')) {
      BlocProvider.of<HomeBloc>(context)
          .add(BagDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Personal')) {
      BlocProvider.of<HomeBloc>(context)
          .add(PersonalCareDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Camera')) {
      BlocProvider.of<HomeBloc>(context)
          .add(CameraDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Gaming')) {
      BlocProvider.of<HomeBloc>(context)
          .add(GamingDeals(prefs.getString('currency')));
    } else if (widget.title.contains('Computer')) {
      BlocProvider.of<HomeBloc>(context)
          .add(FetchComputerCollections(prefs.getString('currency')));
    } else if (widget.title.contains('Mobile')) {
      BlocProvider.of<HomeBloc>(context)
          .add(FetchMobileCollections(prefs.getString('currency')));
    }
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      child: _dealsList(),
    );
  }

  _dealsList() {
    List<DealOfTheDay> deals = [];
    Random rnd = new Random();

    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (widget.title.contains('Tablet')) {
        deals = BlocProvider.of<HomeBloc>(context).tablets;
      } else if (widget.title.contains('Accessories')) {
        deals = BlocProvider.of<HomeBloc>(context).accessories;
      } else if (widget.title.contains('Home')) {
        deals = BlocProvider.of<HomeBloc>(context).homeAppliance;
      } else if (widget.title.contains('Watch')) {
        deals = BlocProvider.of<HomeBloc>(context).watch;
      } else if (widget.title.contains('Bag')) {
        deals = BlocProvider.of<HomeBloc>(context).bags;
      } else if (widget.title.contains('Personal')) {
        deals = BlocProvider.of<HomeBloc>(context).personalCare;
      } else if (widget.title.contains('Camera')) {
        deals = BlocProvider.of<HomeBloc>(context).camera;
      } else if (widget.title.contains('Gaming')) {
        deals = BlocProvider.of<HomeBloc>(context).gaming;
      } else if (widget.title.contains('Computer')) {
        deals = BlocProvider.of<HomeBloc>(context).computerCollections;
      }else if(widget.title.contains('Mobile')){
        deals= BlocProvider.of<HomeBloc>(context).mobileColletions;
      }

      if (state is TodaysDealsLoadingState) {
        return Center(
            child: SpinKitRipple(
          color: Theme.of(context).primaryColor,
          size: 50,
        ));
      }
      if (state is TodaysDealsErrorState) {
        return Container();
      }
      if (deals.isNotEmpty) {
        return Container(
          color: AppColors.WHITE,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * .52,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 2, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListHeader(
                      headerName: '${widget.title}',
                      onTap: () {},
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductByCategoryPage(
                                    categoryId: widget.categoryId,
                                    categoryName: widget.title,
                                  )
                                  // DealsFullPage(
                                  //       currency: prefs.getString('currency'),
                                  //     )
                                      
                                      ));
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 16, color: AppColors.LOGO_ORANGE),
                        ),
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 2, color: AppColors.LOGO_ORANGE)))
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: deals == null ? 0 : deals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DealsCardNew(
                        deal: deals[index],
                        rrating: 3.9 + rnd.nextDouble(),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
                width: 600,
              )
            ],
          ),
        );
      }
      return Center(
          child: SpinKitRipple(
        color: Theme.of(context).primaryColor,
        size: 50,
      ));
    });
  }
}
