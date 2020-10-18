import 'package:covid_refreshed/core/models/models.dart';
import 'package:covid_refreshed/core/services/india_data_service.dart';
import 'package:covid_refreshed/ui/shared/colors.dart';
import 'package:covid_refreshed/ui/widgets/drawer.dart';
import 'package:covid_refreshed/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  Future<IndiaData> _dataFetched;
  @override
  void initState() {
    _dataFetched = fetchIndiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: _dataFetched,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            IndiaData data = snapshot.data;
            return CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: <Widget>[
                _buildHeader(),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: StatsGrid(
                      indiadata: data,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Daily Change in New Cases",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: widthOfScreen,
                            height: 300,
                            child: DailyStat(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("OOPS ERROR");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
