import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../data/units_data.dart';
import '../units_tab_helper.dart';

/// ═══════════════════════════════════════════════════════════
/// تبويب الوحدات
/// ═══════════════════════════════════════════════════════════
class UnitsTab extends StatelessWidget {
  const UnitsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('الوحدات الدراسية')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(AppConstants.spaceM),
          itemCount: allUnits.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppConstants.spaceM),
          itemBuilder: (context, i) => buildUnitCard(context, allUnits[i]),
        ),
      ),
    );
  }
}
