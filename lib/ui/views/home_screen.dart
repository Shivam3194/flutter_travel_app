import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/ui/bloc/clock_bloc/clock_view.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_event.dart';
import 'package:flutter_travel_app/ui/bloc/favourite_bloc/favourite_view.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_view.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_bloc.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_event.dart';
import 'package:flutter_travel_app/ui/views/bottom_icon/favourite_screen.dart';
import 'package:flutter_travel_app/ui/views/bottom_icon/person_screen.dart';
import '../bloc/clock_bloc/clock_bloc.dart';
import '../bloc/clock_bloc/clock_event.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../bloc/home_bloc/home_event.dart';
import '../bloc/person_bloc/person_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    void onHomeSelected() {
      BlocProvider.of<HomeBloc>(context).add(HomeScreenAddEvent());
    }

    void onClockSelected() {
      BlocProvider.of<ClockBloc>(context).add(ClockAddEvent());
    }

    void onFavouriteSelected() {
      BlocProvider.of<FavouriteBloc>(context).add(FavouriteAddEvent());
    }

    void onPersonSelected() {
      BlocProvider.of<PersonBloc>(context).add(PersonAddEvent());
    }

    tabs = [
      HomeView(onSelected: onHomeSelected),
      ClockView(onSelected: onClockSelected),
      FavouriteView(onSelected: onFavouriteSelected),
      PersonView(onSelected: onPersonSelected),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: tabs[_currentIndex],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
