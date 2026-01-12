import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import 'view_cards_screen.dart';
import 'add_card_screen.dart';
import 'print_cards_screen.dart';
import 'package_settings_screen.dart';
import 'print_templates_screen.dart';

class CardsManagementScreen extends StatelessWidget {
  const CardsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'إدارة الكروت'),
              const SizedBox(height: 20),
              
              MenuButton(
                title: 'عرض الكروت',
                icon: Icons.list,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewCardsScreen(),
                    ),
                  );
                },
              ),
              
              MenuButton(
                title: 'إضافة كرت واحد',
                icon: Icons.add,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCardScreen(),
                    ),
                  );
                },
              ),
              
              MenuButton(
                title: 'طباعة عدة كروت',
                icon: Icons.print,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrintCardsScreen(),
                    ),
                  );
                },
              ),
              
              MenuButton(
                title: 'إعدادات باقات الكروت',
                icon: Icons.settings,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PackageSettingsScreen(),
                    ),
                  );
                },
              ),
              
              MenuButton(
                title: 'إدارة قوالب الطباعة',
                icon: Icons.qr_code,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrintTemplatesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
