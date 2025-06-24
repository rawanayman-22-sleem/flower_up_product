import 'package:flutter/material.dart';
import '../core/widgets/colors.dart';
import 'widgets/dashboard_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: DashboardBody(),

    );
  }
}
