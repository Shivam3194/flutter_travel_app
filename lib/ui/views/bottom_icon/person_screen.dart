import 'package:flutter/material.dart';
import 'package:flutter_travel_app/ui/bloc/person_bloc/person_state.dart';

class PersonScreen extends StatelessWidget {
  final PersonLoadedState state;
  const PersonScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Shivam's Person Screen with bloccccccc"),
      ),
    );
  }
}
