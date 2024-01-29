import 'package:flutter/material.dart';
import 'package:flutter_travel_app/ui/views/widgets/google_map_widget.dart';
import '../../bloc/clock_bloc/clock_state.dart';

class ClockScreen extends StatelessWidget {
  final ClockLoadedState state;
  const ClockScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GoogleMapWidget());
  }
}
