import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finemotor/screens/components/main_bottom_nav.dart';
import 'package:finemotor/screens/shell/main_shell/main_shell_bloc.dart';

class MainShellView extends StatelessWidget {
  const MainShellView({
    super.key,
    required this.body,
    required this.selectedIndex,
  });

  final Widget body;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: MainBottomNav(
        selectedIndex: selectedIndex,
        onSelected: (index) => context
            .read<MainShellBloc>()
            .add(MainShellEvent.tabSelected(index)),
      ),
    );
  }
}
