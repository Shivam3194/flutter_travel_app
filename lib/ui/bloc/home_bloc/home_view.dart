import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/custom_files/app_colors.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_event.dart';
import 'package:flutter_travel_app/ui/bloc/home_bloc/home_state.dart';
import 'package:flutter_travel_app/ui/views/bottom_icon/clock_screen.dart';
import '../../views/bottom_icon/home_icon_screen.dart';
import 'package:easy_refresh/easy_refresh.dart';

class HomeView extends StatelessWidget {
  final VoidCallback onSelected;
  HomeView({
    super.key,
    required this.onSelected,
  });

  TextEditingController textEditingController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeScreenAddEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeScreenInitialState ||
              state is HomeScreenLoadingState) {
            return const Scaffold(
              body: Center(
                child: SpinKitCircle(
                  color: AppColors.blue,
                  size: 40.0,
                ),
              ),
            );
          }
          if (state is HomeScreenLoadedState) {
            return HomeIconScreen(state: state);
          } else if (state is HomeScreenEmptyState) {
            return const Center(child: Text("No Data Found"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}


// Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: SizedBox(
      //           child: BlocBuilder<HomeBloc, HomeState>(
      //             builder: (BuildContext context, state) {
      //               if (state is HomeScreenInitialState ||
      //                   state is HomeScreenLoadingState) {
      //                 return const Scaffold(
      //                   body: Center(
      //                     child: SpinKitCircle(
      //                       color: AppColors.blue,
      //                       size: 40.0,
      //                     ),
      //                   ),
      //                 );
      //               }
      //               if (state is HomeScreenLoadedState) {
      //                 final item = state.fieldData!;
      //                 return Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         RichText(
      //                           text: TextSpan(
      //                             children: [
      //                               TextSpan(
      //                                 text:
      //                                     "Hi, ${item.profileInfo!.name ?? ""} 👋\n",
      //                                 style: GoogleFonts.poppins(
      //                                   letterSpacing: 0.3,
      //                                   fontSize: 22,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.black,
      //                                 ),
      //                               ),
      //                               TextSpan(
      //                                 text: "Explore the world",
      //                                 style: GoogleFonts.poppins(
      //                                   letterSpacing: 0.3,
      //                                   fontSize: 18,
      //                                   fontWeight: FontWeight.bold,
      //                                   color: Colors.pink.withOpacity(0.6),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         CircleAvatar(
      //                           radius: 25,
      //                           backgroundColor: Colors.pink.withOpacity(0.1),
      //                           backgroundImage: item
      //                                   .profileInfo!.imageUrl!.isNotEmpty
      //                               ? NetworkImage(item.profileInfo!.imageUrl!)
      //                               : const NetworkImage(''),
      //                         ),
      //                       ],
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(
      //                           top: 32, left: 8, right: 8),
      //                       child: TextField(
      //                         decoration: InputDecoration(
      //                           hintText: 'Search places',
      //                           border: OutlineInputBorder(
      //                             borderSide: const BorderSide(
      //                               color: Colors.black,
      //                             ),
      //                             borderRadius: BorderRadius.circular(24),
      //                           ),
      //                           suffixIcon: const Icon(
      //                             Icons.filter,
      //                           ),
      //                         ),
      //                         controller: textEditingController,
      //                         focusNode: focusNode,
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(
      //                           top: 40, left: 4, right: 4),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Text(
      //                             "Popular places",
      //                             style: GoogleFonts.poppins(
      //                               letterSpacing: 0.3,
      //                               color: Colors.black,
      //                               fontSize: 18,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                           Text(
      //                             "View All",
      //                             style: GoogleFonts.poppins(
      //                               letterSpacing: 0.3,
      //                               color: Colors.pink.withOpacity(0.6),
      //                               fontSize: 15,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(top: 24),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: const [
      //                           Chip(
      //                             label: Text("Most Viewed"),
      //                           ),
      //                           Chip(
      //                             label: Text("Nearby"),
      //                           ),
      //                           Chip(
      //                             label: Text("Latest"),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 );
      //               }
      //               return const SizedBox();
      //             },
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 24),
      //         child: BlocBuilder<HomeBloc, HomeState>(
      //           builder: (context, state) {
      //             if (state is HomeScreenLoadingState) {
      //               return const Scaffold(
      //                 body: Center(
      //                   child: SpinKitCircle(
      //                     color: AppColors.blue,
      //                     size: 40.0,
      //                   ),
      //                 ),
      //               );
      //             }
      //             if (state is HomeScreenLoadedState) {
      //               final item1 = state.fieldData!.placesListDetailed!;
      //               return Container(
      //                 height: 200,
      //                 child: ListView.builder(
      //                   itemCount: item1.length,
      //                   scrollDirection: Axis.horizontal,
      //                   itemBuilder: (context, index) {
      //                     final item2 = item1[index];
      //                     return TouristPlaceWidget(
      //                       item: item2,
      //                     );
      //                   },
      //                 ),
      //               );
      //             }
      //             return const SizedBox();
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
