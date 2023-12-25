import 'package:flutter/material.dart';
import '../../bloc/clock_bloc/clock_state.dart';

class ClockScreen extends StatelessWidget {
  final ClockLoadedState state;
  const ClockScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Shivam's Clock Screen With Bloccccc"),
      ),
    );
  }
}
