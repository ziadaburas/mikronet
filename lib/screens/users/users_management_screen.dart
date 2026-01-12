import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_widgets.dart';
import '../../data/mock_data.dart';
import 'all_users_screen.dart';

class UsersManagementScreen extends StatelessWidget {
  const UsersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = MockData.userStats;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(title: 'المستخدمين'),
              const SizedBox(height: 20),
              
              UserStatCard(
                title: 'الكل',
                count: stats['total']!,
                countColor: AppColors.accentTeal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllUsersScreen(filter: 'all'),
                    ),
                  );
                },
              ),
              
              UserStatCard(
                title: 'النشطين',
                count: stats['active']!,
                countColor: AppColors.accentPink,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllUsersScreen(filter: 'active'),
                    ),
                  );
                },
              ),
              
              UserStatCard(
                title: 'غير النشطين',
                count: stats['inactive']!,
                countColor: AppColors.accentPink,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllUsersScreen(filter: 'inactive'),
                    ),
                  );
                },
              ),
              
              UserStatCard(
                title: 'المحظورين',
                count: stats['banned']!,
                countColor: AppColors.accentPink,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllUsersScreen(filter: 'banned'),
                    ),
                  );
                },
              ),
              
              UserStatCard(
                title: 'مجانا',
                count: stats['free']!,
                countColor: AppColors.accentTeal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllUsersScreen(filter: 'free'),
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
